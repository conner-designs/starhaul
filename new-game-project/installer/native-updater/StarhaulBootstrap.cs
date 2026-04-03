using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace Starhaul.Updater
{
    internal static class Program
    {
        [STAThread]
        private static void Main(string[] args)
        {
            ServicePointManager.SecurityProtocol =
                SecurityProtocolType.Tls12 |
                SecurityProtocolType.Tls11 |
                SecurityProtocolType.Tls;

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            try
            {
                using (var bootstrap = new BootstrapApp(args))
                {
                    bootstrap.Run();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Starhaul bootstrap failed.\r\n\r\n" + ex.Message,
                    "Starhaul Installer Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }
        }
    }

    [DataContract]
    internal sealed class ReleaseManifest
    {
        [DataMember(Name = "version")]
        public string Version { get; set; }

        [DataMember(Name = "packageUrl")]
        public string PackageUrl { get; set; }

        [DataMember(Name = "sha256")]
        public string Sha256 { get; set; }

        [DataMember(Name = "sizeBytes")]
        public long SizeBytes { get; set; }

        [DataMember(Name = "entryExecutable")]
        public string EntryExecutable { get; set; }

        [DataMember(Name = "publishedUtc")]
        public string PublishedUtc { get; set; }
    }

    [DataContract]
    internal sealed class InstallConfig
    {
        [DataMember(Name = "publisher")]
        public string Publisher { get; set; }

        [DataMember(Name = "gameName")]
        public string GameName { get; set; }

        [DataMember(Name = "installedVersion")]
        public string InstalledVersion { get; set; }

        [DataMember(Name = "manifestUrl")]
        public string ManifestUrl { get; set; }

        [DataMember(Name = "entryExecutable")]
        public string EntryExecutable { get; set; }

        [DataMember(Name = "lastUpdatedUtc")]
        public string LastUpdatedUtc { get; set; }
    }

    internal sealed class InstallPaths
    {
        public string Root { get; private set; }
        public string ConfigPath { get; private set; }
        public string GamePath { get; private set; }
        public string StagingPath { get; private set; }
        public string DownloadPath { get; private set; }
        public string LauncherPath { get; private set; }

        public static InstallPaths Create(string publisher, string gameName)
        {
            var root = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "Games",
                publisher,
                gameName
            );

            return new InstallPaths
            {
                Root = root,
                ConfigPath = Path.Combine(root, "install-config.json"),
                GamePath = Path.Combine(root, "current"),
                StagingPath = Path.Combine(root, "staging"),
                DownloadPath = Path.Combine(root, "downloads"),
                LauncherPath = Path.Combine(root, "StarhaulLauncher.exe")
            };
        }
    }

    internal sealed class BootstrapApp : IDisposable
    {
        private const string GameName = "Starhaul";
        private const string Publisher = "Conner Designs";
        private const string ManifestUrl = "https://conner-designs.github.io/starhaul/manifest.json";
        private const string DefaultEntryExecutable = "starhaul_windows.exe";

        private readonly bool _launchMode;
        private readonly InstallPaths _paths;
        private readonly string _selfPath;

        public BootstrapApp(string[] args)
        {
            _launchMode = args != null && Array.Exists(args, a => string.Equals(a, "--launch", StringComparison.OrdinalIgnoreCase));
            _paths = InstallPaths.Create(Publisher, GameName);
            _selfPath = Application.ExecutablePath;
        }

        public void Run()
        {
            if (_launchMode)
            {
                RunLaunchMode();
                return;
            }

            Application.Run(CreateInstallerForm());
        }

        private Form CreateInstallerForm()
        {
            var form = new Form();
            form.Text = GameName + " Installer";
            form.StartPosition = FormStartPosition.CenterScreen;
            form.ClientSize = new Size(480, 240);
            form.FormBorderStyle = FormBorderStyle.FixedDialog;
            form.MaximizeBox = false;

            var title = new Label();
            title.Text = "Install " + GameName;
            title.Font = new Font("Segoe UI", 15f, FontStyle.Bold);
            title.AutoSize = true;
            title.Location = new Point(24, 20);
            form.Controls.Add(title);

            var body = new Label();
            body.Text = "Install the latest Starhaul playtest build and create a desktop shortcut with built-in update checks.";
            body.Size = new Size(420, 48);
            body.Location = new Point(24, 60);
            form.Controls.Add(body);

            var pathLabel = new Label();
            pathLabel.Text = "Install location: " + _paths.Root;
            pathLabel.Size = new Size(420, 40);
            pathLabel.Location = new Point(24, 108);
            form.Controls.Add(pathLabel);

            var statusLabel = new Label();
            statusLabel.Text = "Ready.";
            statusLabel.Size = new Size(420, 24);
            statusLabel.Location = new Point(24, 148);
            form.Controls.Add(statusLabel);

            var installButton = new Button();
            installButton.Text = "Install";
            installButton.Size = new Size(100, 32);
            installButton.Location = new Point(260, 176);
            installButton.Click += (sender, args) =>
            {
                installButton.Enabled = false;
                try
                {
                    InstallLatest(statusLabel, form);
                    installButton.Enabled = true;
                }
                catch (Exception ex)
                {
                    installButton.Enabled = true;
                    statusLabel.Text = "Install failed.";
                    MessageBox.Show(
                        "Installation failed.\r\n\r\n" + ex.Message,
                        GameName + " Installer Error",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error
                    );
                }
            };
            form.Controls.Add(installButton);

            var cancelButton = new Button();
            cancelButton.Text = "Cancel";
            cancelButton.Size = new Size(100, 32);
            cancelButton.Location = new Point(368, 176);
            cancelButton.Click += (sender, args) => form.Close();
            form.Controls.Add(cancelButton);

            return form;
        }

        private void InstallLatest(Label statusLabel, Form form)
        {
            statusLabel.Text = "Downloading latest release...";
            form.Refresh();

            var manifest = DownloadManifest();

            statusLabel.Text = "Installing files...";
            form.Refresh();

            var config = InstallManifestRelease(manifest);
            CopyLauncherBinary();
            CreateDesktopShortcut();

            statusLabel.Text = "Installed " + GameName + " " + config.InstalledVersion;
            MessageBox.Show(
                GameName + " has been installed successfully.",
                GameName + " Installer",
                MessageBoxButtons.OK,
                MessageBoxIcon.Information
            );
        }

        private void RunLaunchMode()
        {
            var config = ReadInstallConfig();
            var manifest = DownloadManifest();

            if (IsUpdateRequired(manifest, config))
            {
                config = InstallManifestRelease(manifest);
                CopyLauncherBinary();
            }

            var entryExecutable = config != null && !string.IsNullOrWhiteSpace(config.EntryExecutable)
                ? config.EntryExecutable
                : DefaultEntryExecutable;

            var gameExe = ResolveEntryExecutablePath(_paths.GamePath, entryExecutable);
            var startInfo = new ProcessStartInfo
            {
                FileName = gameExe,
                WorkingDirectory = Path.GetDirectoryName(gameExe) ?? _paths.GamePath,
                UseShellExecute = true
            };
            Process.Start(startInfo);
        }

        private ReleaseManifest DownloadManifest()
        {
            using (var client = new WebClient())
            {
                client.Headers.Add(HttpRequestHeader.UserAgent, "StarhaulUpdater/1.0");
                var json = client.DownloadString(ManifestUrl);
                return DeserializeJson<ReleaseManifest>(json);
            }
        }

        private InstallConfig InstallManifestRelease(ReleaseManifest manifest)
        {
            EnsureDirectory(_paths.Root);
            EnsureDirectory(_paths.DownloadPath);

            var zipName = "release-" + manifest.Version + ".zip";
            var zipPath = Path.Combine(_paths.DownloadPath, zipName);

            using (var client = new WebClient())
            {
                client.Headers.Add(HttpRequestHeader.UserAgent, "StarhaulUpdater/1.0");
                client.DownloadFile(manifest.PackageUrl, zipPath);
            }

            var actualHash = GetFileSha256(zipPath);
            if (!string.Equals(actualHash, (manifest.Sha256 ?? string.Empty).ToLowerInvariant(), StringComparison.Ordinal))
            {
                throw new InvalidOperationException("SHA-256 mismatch for downloaded update package.");
            }

            if (Directory.Exists(_paths.StagingPath))
            {
                Directory.Delete(_paths.StagingPath, true);
            }

            Directory.CreateDirectory(_paths.StagingPath);
            ZipFile.ExtractToDirectory(zipPath, _paths.StagingPath);

            if (Directory.Exists(_paths.GamePath))
            {
                Directory.Delete(_paths.GamePath, true);
            }

            Directory.Move(_paths.StagingPath, _paths.GamePath);

            var config = new InstallConfig
            {
                Publisher = Publisher,
                GameName = GameName,
                InstalledVersion = manifest.Version,
                ManifestUrl = ManifestUrl,
                EntryExecutable = string.IsNullOrWhiteSpace(manifest.EntryExecutable) ? DefaultEntryExecutable : manifest.EntryExecutable,
                LastUpdatedUtc = DateTime.UtcNow.ToString("o")
            };

            WriteInstallConfig(config);
            return config;
        }

        private InstallConfig ReadInstallConfig()
        {
            if (!File.Exists(_paths.ConfigPath))
            {
                return null;
            }

            var json = File.ReadAllText(_paths.ConfigPath, Encoding.UTF8);
            return DeserializeJson<InstallConfig>(json);
        }

        private void WriteInstallConfig(InstallConfig config)
        {
            EnsureDirectory(_paths.Root);
            var serializer = new DataContractJsonSerializer(typeof(InstallConfig));
            using (var stream = new FileStream(_paths.ConfigPath, FileMode.Create, FileAccess.Write, FileShare.None))
            {
                serializer.WriteObject(stream, config);
            }
        }

        private bool IsUpdateRequired(ReleaseManifest manifest, InstallConfig config)
        {
            if (config == null || string.IsNullOrWhiteSpace(config.InstalledVersion))
            {
                return true;
            }

            Version remoteVersion;
            Version localVersion;
            if (TryParseVersion(manifest.Version, out remoteVersion) && TryParseVersion(config.InstalledVersion, out localVersion))
            {
                return remoteVersion > localVersion;
            }

            return !string.Equals(manifest.Version, config.InstalledVersion, StringComparison.OrdinalIgnoreCase);
        }

        private void CopyLauncherBinary()
        {
            EnsureDirectory(_paths.Root);
            File.Copy(_selfPath, _paths.LauncherPath, true);
        }

        private void CreateDesktopShortcut()
        {
            var desktopPath = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
            var shortcutPath = Path.Combine(desktopPath, GameName + ".lnk");

            var shellType = Type.GetTypeFromProgID("WScript.Shell");
            if (shellType == null)
            {
                throw new InvalidOperationException("WScript.Shell is not available to create desktop shortcuts.");
            }

            dynamic shell = Activator.CreateInstance(shellType);
            dynamic shortcut = shell.CreateShortcut(shortcutPath);
            shortcut.TargetPath = _paths.LauncherPath;
            shortcut.Arguments = "--launch";
            shortcut.WorkingDirectory = _paths.Root;

            var config = ReadInstallConfig();
            if (config != null)
            {
                try
                {
                    shortcut.IconLocation = ResolveEntryExecutablePath(_paths.GamePath, config.EntryExecutable);
                }
                catch
                {
                }
            }

            shortcut.Save();
        }

        private static string ResolveEntryExecutablePath(string gamePath, string entryExecutable)
        {
            var directPath = Path.Combine(gamePath, entryExecutable);
            if (File.Exists(directPath))
            {
                return directPath;
            }

            var matches = Directory.GetFiles(gamePath, entryExecutable, SearchOption.AllDirectories);
            if (matches.Length == 0)
            {
                throw new FileNotFoundException("Entry executable not found under installed game path.", entryExecutable);
            }

            return matches[0];
        }

        private static string GetFileSha256(string path)
        {
            using (var stream = File.OpenRead(path))
            using (var sha = SHA256.Create())
            {
                var hash = sha.ComputeHash(stream);
                var builder = new StringBuilder(hash.Length * 2);
                foreach (var b in hash)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private static T DeserializeJson<T>(string json)
        {
            if (json == null)
            {
                throw new InvalidOperationException("JSON content was empty.");
            }

            var clean = json.Trim();
            if (clean.Length > 0 && clean[0] == '\uFEFF')
            {
                clean = clean.Substring(1);
            }

            var serializer = new DataContractJsonSerializer(typeof(T));
            using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(clean)))
            {
                return (T)serializer.ReadObject(stream);
            }
        }

        private static bool TryParseVersion(string input, out Version version)
        {
            version = null;
            if (string.IsNullOrWhiteSpace(input))
            {
                return false;
            }

            var normalized = input.Trim();
            if (normalized.StartsWith("v", StringComparison.OrdinalIgnoreCase))
            {
                normalized = normalized.Substring(1);
            }

            var hyphenIndex = normalized.IndexOf('-');
            if (hyphenIndex >= 0)
            {
                normalized = normalized.Substring(0, hyphenIndex);
            }

            Version parsed;
            if (Version.TryParse(normalized, out parsed))
            {
                version = parsed;
                return true;
            }

            return false;
        }

        private static void EnsureDirectory(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }

        public void Dispose()
        {
        }
    }
}

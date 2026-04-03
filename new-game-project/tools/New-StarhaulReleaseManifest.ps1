param(
    [Parameter(Mandatory = $true)][string]$Version,
    [Parameter(Mandatory = $true)][string]$PackagePath,
    [string]$PackageUrl,
    [string]$EntryExecutable = "starhaul_windows.exe",
    [string]$OutputPath,
    [string]$RepositoryOwner = "conner-designs",
    [string]$RepositoryName = "starhaul",
    [string]$Tag,
    [string]$AssetName = "starhaul_windows_build.zip"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $PackagePath)) {
    throw "Package path '$PackagePath' does not exist."
}

$projectRoot = Split-Path -Parent $PSScriptRoot
$repoRoot = Split-Path -Parent $projectRoot

if ([string]::IsNullOrWhiteSpace($Tag)) {
    $Tag = "v$Version"
}

if ([string]::IsNullOrWhiteSpace($PackageUrl)) {
    $PackageUrl = "https://github.com/$RepositoryOwner/$RepositoryName/releases/download/$Tag/$AssetName"
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $repoRoot "docs\manifest.json"
}

$sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $PackagePath).Hash.ToLowerInvariant()
$sizeBytes = (Get-Item -LiteralPath $PackagePath).Length

$manifest = [pscustomobject]@{
    version         = $Version
    packageUrl      = $PackageUrl
    sha256          = $sha256
    sizeBytes       = $sizeBytes
    entryExecutable = $EntryExecutable
    publishedUtc    = [DateTime]::UtcNow.ToString("o")
}

$manifest | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Output "Manifest written to $OutputPath"

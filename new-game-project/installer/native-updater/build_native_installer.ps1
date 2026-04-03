param(
    [string]$OutputPath = ""
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourcePath = Join-Path $scriptDir "StarhaulBootstrap.cs"

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $scriptDir "StarhaulInstaller.exe"
}

$csc = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if (-not (Test-Path -LiteralPath $csc)) {
    $csc = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
}

if (-not (Test-Path -LiteralPath $csc)) {
    throw "Could not find csc.exe for .NET Framework 4.x."
}

& $csc `
    /target:winexe `
    /optimize+ `
    /out:$OutputPath `
    /reference:System.dll `
    /reference:System.Core.dll `
    /reference:System.Drawing.dll `
    /reference:System.Windows.Forms.dll `
    /reference:System.Runtime.Serialization.dll `
    /reference:System.IO.Compression.FileSystem.dll `
    $sourcePath

if ($LASTEXITCODE -ne 0) {
    throw "Native installer build failed with exit code $LASTEXITCODE."
}

Write-Output "Built native installer: $OutputPath"

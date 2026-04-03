param(
    [Parameter(Mandatory = $true)][string]$Version,
    [string]$Tag,
    [string]$EntryExecutable = "starhaul_windows.exe",
    [string]$AssetName = "starhaul_windows_build.zip",
    [string]$RepositoryOwner = "conner-designs",
    [string]$RepositoryName = "starhaul"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$repoRoot = Split-Path -Parent $projectRoot

if ([string]::IsNullOrWhiteSpace($Tag)) {
    $Tag = "v$Version"
}

$buildRoot = Join-Path $projectRoot "builds"
$releaseRoot = Join-Path $buildRoot "release"
$exePath = Join-Path $buildRoot "starhaul_windows.exe"
$pckPath = Join-Path $buildRoot "starhaul_windows.pck"
$zipPath = Join-Path $releaseRoot $AssetName
$manifestScript = Join-Path $PSScriptRoot "New-StarhaulReleaseManifest.ps1"
$manifestPath = Join-Path $repoRoot "docs\manifest.json"

if (-not (Test-Path -LiteralPath $exePath)) {
    throw "Missing export file: $exePath"
}

if (-not (Test-Path -LiteralPath $pckPath)) {
    throw "Missing export file: $pckPath"
}

if (-not (Test-Path -LiteralPath $releaseRoot)) {
    New-Item -ItemType Directory -Path $releaseRoot | Out-Null
}

if (Test-Path -LiteralPath $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}

Compress-Archive -LiteralPath $exePath, $pckPath -DestinationPath $zipPath -Force

& $manifestScript `
    -Version $Version `
    -Tag $Tag `
    -PackagePath $zipPath `
    -RepositoryOwner $RepositoryOwner `
    -RepositoryName $RepositoryName `
    -AssetName $AssetName `
    -EntryExecutable $EntryExecutable `
    -OutputPath $manifestPath

Write-Output "Release zip ready: $zipPath"
Write-Output "Manifest ready: $manifestPath"
Write-Output "Expected release asset URL: https://github.com/$RepositoryOwner/$RepositoryName/releases/download/$Tag/$AssetName"

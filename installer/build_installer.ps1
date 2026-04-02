param(
    [string]$InnoCompiler = "C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$scriptPath = Join-Path $PSScriptRoot "STARHAUL.iss"
$exePath = Join-Path $projectRoot "builds\starhaul_windows.exe"
$pckPath = Join-Path $projectRoot "builds\starhaul_windows.pck"

if (-not (Test-Path $exePath)) {
    throw "Missing export: $exePath"
}

if (-not (Test-Path $pckPath)) {
    throw "Missing export: $pckPath"
}

if (-not (Test-Path $InnoCompiler)) {
    throw "Inno Setup compiler not found at: $InnoCompiler"
}

& $InnoCompiler $scriptPath

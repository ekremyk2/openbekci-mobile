<#
.SYNOPSIS
  Builds the prod Android App Bundle; the same as tool/release.sh (see its header for the variables).
.PARAMETER DryRun
  Print the flutter command instead of running it.
#>
param([switch]$DryRun)
$ErrorActionPreference = 'Stop'
Set-Location (Join-Path $PSScriptRoot '..')
$version = (Get-Content VERSION -Raw).Trim()
if ($version -notmatch '^\d+\.\d+\.\d+(-[0-9A-Za-z.]+)?$') { throw "VERSION '$version' is not semver" }
$build = if ($env:BUILD_NUMBER) { $env:BUILD_NUMBER } elseif ($env:GITHUB_RUN_NUMBER) { $env:GITHUB_RUN_NUMBER } else { (git rev-list --count HEAD).Trim() }
if (-not $env:OPENBEKCI_KEYSTORE -and $env:OPENBEKCI_ALLOW_DEBUG_SIGNING -ne '1') {
  throw 'OPENBEKCI_KEYSTORE is not set; set it, or OPENBEKCI_ALLOW_DEBUG_SIGNING=1 for a test bundle'
}
$flutterArgs = @('build', 'appbundle', '--release', '--flavor', 'prod', '-t', 'lib/main_prod.dart', '--build-name', $version, '--build-number', $build)
if ($env:OPENBEKCI_SERVER) { $flutterArgs += "--dart-define=OPENBEKCI_SERVER=$($env:OPENBEKCI_SERVER)" }
if ($env:OPENBEKCI_DEFINES_FILE) { $flutterArgs += "--dart-define-from-file=$($env:OPENBEKCI_DEFINES_FILE)" }
if ($DryRun) { Write-Output "flutter $($flutterArgs -join ' ')"; exit 0 }
flutter @flutterArgs
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Output "Built $version+$build: build/app/outputs/bundle/prodRelease/app-prod-release.aab"

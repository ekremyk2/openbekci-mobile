<#
.SYNOPSIS
  Pins the OpenBekci API spec: copies the bundled openapi.yaml from a core checkout into spec/
  and records the core commit it came from in spec/api_version.lock.

.PARAMETER CoreRepo
  Path of the core repository checkout (default: ../OpenBekci next to this repository,
  or $env:OPENBEKCI_CORE_REPO).
#>
param([string]$CoreRepo = $(if ($env:OPENBEKCI_CORE_REPO) { $env:OPENBEKCI_CORE_REPO } else { Join-Path $PSScriptRoot '..\..\OpenBekci' }))
$ErrorActionPreference = 'Stop'
$root = Resolve-Path (Join-Path $PSScriptRoot '..')
$core = Resolve-Path $CoreRepo
$src = Join-Path $core 'api\openapi.yaml'
if (-not (Test-Path $src)) { throw "No api/openapi.yaml in $core" }
$commit = (git -C $core rev-parse HEAD).Trim()
$dirty = (git -C $core status --porcelain -- api/openapi.yaml)
$specDir = Join-Path $root 'spec'
New-Item -ItemType Directory -Force $specDir | Out-Null
Copy-Item $src (Join-Path $specDir 'openapi.yaml') -Force
$hash = (Get-FileHash (Join-Path $specDir 'openapi.yaml') -Algorithm SHA256).Hash.ToLower()
$lock = @("commit=$commit", "sha256=$hash", "source=api/openapi.yaml")
if ($dirty) { $lock += 'dirty=true' }
Set-Content -Path (Join-Path $specDir 'api_version.lock') -Value $lock -Encoding ascii
Write-Host "Pinned spec from $core @ $commit (sha256 $hash)"

# Windows wrapper: runs tool/generate_client.sh with Git Bash (JAVA_HOME and dart/flutter must be on PATH).
$ErrorActionPreference = 'Stop'
$bash = (Get-Command bash -ErrorAction Stop).Source
& $bash (Join-Path $PSScriptRoot 'generate_client.sh')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

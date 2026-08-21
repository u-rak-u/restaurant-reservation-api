[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$projectDirectory = Split-Path -Parent $PSScriptRoot
$probeCommand = 'export PGPASSWORD="$POSTGRES_PASSWORD"; exec psql --host=127.0.0.1 --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" --no-password --set=ON_ERROR_STOP=1 --command="SELECT 1;" >/dev/null'
$locationChanged = $false

try {
    Push-Location -LiteralPath $projectDirectory
    $locationChanged = $true

    $probeOutput = & docker compose exec -T db sh -eu -c $probeCommand 2>&1
    $probeExitCode = $LASTEXITCODE
    $probeOutput = $null

    if ($probeExitCode -ne 0) {
        throw "Database connection check failed (exit code: $probeExitCode). Check Docker Desktop, the db container, and whether .env matches the database role password."
    }

    Write-Output "Database connection check: OK"
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
finally {
    if ($locationChanged) {
        Pop-Location
    }
}

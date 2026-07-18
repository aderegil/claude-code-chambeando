<#
    Aplica el bloque spinnerVerbs del Pack Jalapeño al settings.json
    de usuario de Claude Code en Windows (%USERPROFILE%\.claude\settings.json).

    Este script es el motor que invoca instalar-windows.bat.
#>

param(
    [ValidateSet('replace', 'append')]
    [string]$Mode = ''
)

$ErrorActionPreference = 'Stop'

$scriptDir   = Split-Path -Parent $MyInvocation.MyCommand.Path
$packPath    = Join-Path $scriptDir 'jalapeno.json'
$settingsDir = Join-Path $env:USERPROFILE '.claude'
$settingsPath = Join-Path $settingsDir 'settings.json'

if (-not (Test-Path $packPath)) {
    Write-Host "No se encontro jalapeno.json junto a este script en: $scriptDir" -ForegroundColor Red
    exit 1
}

$pack = Get-Content -Raw -Path $packPath -Encoding UTF8 | ConvertFrom-Json
$spinnerVerbs = $pack.spinnerVerbs

if ($Mode -ne '') {
    $spinnerVerbs.mode = $Mode
}

if (-not (Test-Path $settingsDir)) {
    New-Item -ItemType Directory -Path $settingsDir -Force | Out-Null
}

if (Test-Path $settingsPath) {
    $raw = Get-Content -Raw -Path $settingsPath -Encoding UTF8
    if ([string]::IsNullOrWhiteSpace($raw)) {
        $settings = [pscustomobject]@{}
    } else {
        try {
            $settings = $raw | ConvertFrom-Json
        } catch {
            Write-Host "El settings.json existente no es JSON valido. No se modifico nada." -ForegroundColor Red
            Write-Host "Ruta: $settingsPath" -ForegroundColor Red
            exit 1
        }
    }

    $backupPath = "$settingsPath.bak-$(Get-Date -Format 'yyyyMMddHHmmss')"
    Copy-Item -Path $settingsPath -Destination $backupPath -Force
    Write-Host "Respaldo creado en: $backupPath"
} else {
    $settings = [pscustomobject]@{}
}

if ($settings.PSObject.Properties.Name -contains 'spinnerVerbs') {
    $settings.spinnerVerbs = $spinnerVerbs
} else {
    $settings | Add-Member -MemberType NoteProperty -Name 'spinnerVerbs' -Value $spinnerVerbs
}

$json = $settings | ConvertTo-Json -Depth 20
[System.IO.File]::WriteAllText($settingsPath, $json, (New-Object System.Text.UTF8Encoding($false)))

Write-Host ""
Write-Host "Listo. Se aplicaron $($spinnerVerbs.verbs.Count) verbos del Pack Jalapeno (modo: $($spinnerVerbs.mode)) a:" -ForegroundColor Green
Write-Host "  $settingsPath"
Write-Host ""
Write-Host "Cierra tu sesion de Claude Code y abre una nueva para verlos."

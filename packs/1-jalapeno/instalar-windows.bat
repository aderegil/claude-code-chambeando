@echo off
setlocal

rem Instala el Pack Jalapeno (spinnerVerbs) en el settings.json de usuario
rem de Claude Code en Windows: %USERPROFILE%\.claude\settings.json
rem
rem Uso:
rem   instalar-windows.bat            (modo del pack, replace por defecto)
rem   instalar-windows.bat append     (mezcla los verbos con los del default)
rem   instalar-windows.bat replace    (sustituye los verbos del default)

set "SCRIPT_DIR=%~dp0"
set "PS1=%SCRIPT_DIR%instalar-windows.ps1"
set "MODE_ARG=%~1"

if not exist "%PS1%" (
    echo No se encontro instalar-windows.ps1 junto a este .bat.
    echo Asegurate de correr este archivo dentro de packs\1-jalapeno\ del repo.
    pause
    exit /b 1
)

where powershell >nul 2>nul
if %errorlevel% equ 0 (
    set "PWSH=powershell"
) else (
    where pwsh >nul 2>nul
    if %errorlevel% equ 0 (
        set "PWSH=pwsh"
    ) else (
        echo No se encontro PowerShell en este sistema. No se puede continuar.
        pause
        exit /b 1
    )
)

if "%MODE_ARG%"=="" (
    %PWSH% -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
) else (
    %PWSH% -NoProfile -ExecutionPolicy Bypass -File "%PS1%" -Mode "%MODE_ARG%"
)

if errorlevel 1 (
    echo.
    echo La instalacion fallo. Revisa el mensaje de arriba.
    pause
    exit /b 1
)

pause

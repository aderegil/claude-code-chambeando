@echo off
setlocal

rem ============================================================
rem Pack Jalapeno para Claude Code - instalador para Windows
rem
rem Archivo autocontenido: no depende de jalapeno.json ni de
rem ningun script .ps1 externo. Los 165 verbos van embebidos
rem abajo, codificados en Base64 (UTF-8) para evitar problemas
rem de acentos con la consola de Windows.
rem
rem Aplica o retira el bloque "spinnerVerbs" en:
rem   %USERPROFILE%\.claude\settings.json
rem
rem Uso:
rem   instalar-windows.bat              (muestra un menu)
rem   instalar-windows.bat instalar
rem   instalar-windows.bat desinstalar
rem ============================================================

set "SETTINGS_DIR=%USERPROFILE%\.claude"
set "SETTINGS_FILE=%SETTINGS_DIR%\settings.json"

set "VERBS_B64=QWNoaWNoYXJyw6FuZG9zZXxBY2hpY29wYWzDoW5kb3NlfEFjaWNhbGFuZG98QWNvbWlkacOpbmRvc2V8QWfDvGl0w6FuZG9zZXxBZ3VhbnRhbmRvIHRhbnRpdG98QWjDrSBsYSBsbGV2b3xBaG9yaXRhIG1lcm8gcXVlZGF8QWhvcml0YSBxdWVkYXxBaG9yaXRpdGEgcXVlZGF8QWxidXJlYW5kb3xBbGVicmVzdMOhbmRvc2V8QWxlYnJpamVhbmRvfEFtYXJyYW5kbyBjYWJvc3xBbnRvasOhbmRvc2V8QXBhY2h1cnJhbmRvIHRlY2xhc3xBcGFudGFsbGFuZG98QXBhcGFjaGFuZG98QXBlY2h1Z2FuZG98QXB1csOhbmRvc2V8QXJnw7xlbmRlYW5kb3xBcnJ1bGxhbmRvfEFzb2xlw6FuZG9zZXxBdGFzY8OhbmRvc2V8QmFsY29uZWFuZG98QmVuZGljaWVuZG98QmlycmllYW5kb3xCb3Jsb3RlYW5kb3xCb3RhbmVhbmRvfEJyaW5jb3RlYW5kb3xCdXNjw6FuZG9sZSB0cmVzIHBpZXMgYWwgZ2F0b3xDYWxhdmVyaXRlYW5kb3xDYWxlbnRhbmRvIGxhIHNpbGxhfENhbnRhbmRvIENpZWxpdG8gTGluZG98Q2FudGFuZG8gRWwgUmV5fENhbnRhbmRvIExhcyBNYcOxYW5pdGFzfENhbnRhbmRvIE3DqXhpY28gTGluZG8geSBRdWVyaWRvfENhc2NhcmVhbmRvfENoYWNoYXJlYW5kb3xDaGFtYmVhbmRvfENoYW5jbGVhbmRvfENoYXB1bGluZWFuZG98Q2hhcm9sZWFuZG98Q2hpY2hpY3VpbG90ZWFuZG98Q2hpbGFxdWlsZWFuZG98Q2hpc21lYW5kb3xDb2NpbmFuZG8gYSBmdWVnbyBsZW50b3xDb21hZHJlYW5kb3xDb21iaWFuZG98Q29tcGFkcmVhbmRvfENvcnRvY2lyY3VpdGXDoW5kb3NlfENvdG9ycmVhbmRvfEN1Y2hpY2hlYW5kb3xDdW1iaWFuZG98RMOhbmRvbGUgdnVlbG8gYSBsYSBoaWxhY2hhfERlc2NvbmNoaW5mbGFuZG98RGVzY3VicmllbmRvIGVsIGFndWEgdGliaWF8RGVzcGVsdWNhbmRvfEVjaGFuZG8gYWd1YXN8RWNoYW5kbyBjYXJyaWxsYXxFY2hhbmRvIGZsb2plcmF8RWNoYW5kbyBtYXJvbWFzfEVjaGFuZG8gbW9zY2F8RWNoYW5kbyBwYWxvbWF6b3xFY2hhbmRvIHVuIHZvbGFkb3xFY2jDoW5kb2xlIGdhbmFzfEVjaMOhbmRvbGUgZ3VhY2Ftb2xlfEVjaMOhbmRvbGUgbGltw7NufEVjaMOhbmRvc2UgZmxvcmVzIHNvbGl0b3xFY2jDoW5kb3NlIHVuIGNsYXZhZG98RWNow6FuZG9zZSB1biBjb3lvdGl0b3xFY2jDoW5kb3NlIHVuIHRhY298RW4gdW4gcmF0aXRvIHF1ZWRhfEVuY2FyacOxw6FuZG9zZXxFbmNhcnJlcsOhbmRvc2V8RW5jb21lbmTDoW5kb3NlIGEgU2FuIEp1ZGFzfEVuY29tZW5kw6FuZG9zZSBhIExhIFZpcmdlbmNpdGF8RW5jb250csOhbmRvbGUgZWwgbW9kb3xFc2NvbWJyYW5kb3xGYXJvbGVhbmRvfEZyYW5lbGVhbmRvfEdvZGluZWFuZG98R29ycmVhbmRvfEhhY2llbmRvIGVsIGphbGV8SGFjaWVuZG8gZWwgcGFyb3xIYWNpZW5kbyBzb3Blc3xIYWNpw6luZG9zZSBndWFqZXxIYWNpw6luZG9zZSBwYXRvfEhlY2hvIGJvbGFzfEludmVudGFuZG8gZWwgaGlsbyBuZWdyb3xJbnZlbnRhbmRvIGxhIHJ1ZWRhfEl0YWNhdGVhbmRvfEphbGFuZG98SmFsYW5kbyBwYXJlam98SmluZXRlYW5kb3xKdWdhbmRvIExvdGVyw61hfEp1cmFuZG8gcXVlIG5vIHBpY2F8TGEgw7psdGltYSB5IG5vcyB2YW1vc3xMbGV2YW5kbyBzZXJlbmF0YXxMdWNoYW5kb3xNYWRydWfDoW5kb2xlfE1hw7Fhbml0ZWFuZG98TWFuZ29uZWFuZG98TWFyaWFjaGVhbmRvfE1ldGllbmRvIGxhIHBhdGF8TWl0b3RlYW5kb3xNaXhpb3RlYW5kb3xNb2xjYWpldGVhbmRvfE5pbmd1bmVhbmRvfE5vIGVyZXMgdMO6LCBzb3kgeW98Tm8gcmFqw6FuZG9zZXxPZnJlbmRhbmRvfFBhamFyZWFuZG98UGFsb21lYW5kb3xQYXJ0aWVuZG8gbGEgcm9zY2F8UGFzdG9yZWFuZG98UGF0aW7DoW5kb2xlIGVsIGNvY298UGF5YXNlYW5kb3xQZXJlZ3JpbmFuZG98UGVyZWdyaW5hbmRvIGEgbGEgVmlsbGF8UGVyc2lnbsOhbmRvc2UgdHJlcyB2ZWNlc3xQZXNlcmVhbmRvfFBpZGllbmRvIHBvc2FkYXxQaXN0ZWFuZG98UGl6Y2FuZG98UGxhbmNoYW5kbyBvcmVqYXxQb25pw6luZG9sZSBmcmlqb2xpdG9zfFBvbmnDqW5kb3NlIGxhcyBwaWxhc3xQb3pvbGVhbmRvfFB1ZWJsZWFuZG98UXVlc2FkaWxsZWFuZG98UXVpbmNlbmFuZG98UmVjYWxlbnRhbmRvfFJlZnJlc3F1ZWFuZG98UmVnw6FuZG9sYSBib25pdG98UmVnYXRlYW5kb3xSZWxhamVhbmRvfFJlbmVnYW5kb3xSZXNwaW5nYW5kb3xSaWbDoW5kb3NlbGF8UnVsZXRlYW5kb3xTYWNhbmRvIGNoaXNwYXN8U2FjYW5kbyBsYSBjYXN0YXxTYWNhbmRvIGxhIGNoYW1iYXxTYWPDoW5kb2xlIHB1bnRhfFNhY8OhbmRvbG8gYWRlbGFudGV8U2Fsc2VhbmRvfFNhem9uYW5kb3xTb25pZGVhbmRvfFRhbGFjaGVhbmRvfFRhbWFsZWFuZG98VGFxdWVhbmRvfFRhcmFyZWFuZG8gTGEgQ3VjYXJhY2hhfFRhcmFyZWFuZG8gTGEgTGxvcm9uYXxUYXRlbWFuZG98VGlhbmd1aXNlYW5kb3xUb2NhbmRvIG1hZGVyYXxUb3J0ZWFuZG98VHJhbWFuZG98VHVyaXN0ZWFuZG98VmFjaWxhbmRvfFZvbHRlYW5kbyBsYSB0b3J0aWxsYXxWb3kgZW4gY2hpbmdhfFlhIGNhc2kgcXVlZGF8WWEgbWVyaXRv"

set "ACTION=%~1"
if "%ACTION%"=="" goto :menu
if /i "%ACTION%"=="instalar" goto :install
if /i "%ACTION%"=="install" goto :install
if /i "%ACTION%"=="desinstalar" goto :uninstall
if /i "%ACTION%"=="uninstall" goto :uninstall

echo Opcion no reconocida: %ACTION%
goto :usage

:menu
echo.
echo   Pack Jalapeno para Claude Code
echo   ================================
echo   1. Instalar    (agrega los 165 verbos a tu settings.json)
echo   2. Desinstalar (quita el bloque spinnerVerbs)
echo   3. Salir
echo.
set /p "OPCION=Elige una opcion (1-3): "
if "%OPCION%"=="1" goto :install
if "%OPCION%"=="2" goto :uninstall
if "%OPCION%"=="3" exit /b 0
echo Opcion invalida.
goto :menu

:usage
echo Uso: %~nx0 [instalar^|desinstalar]
pause
exit /b 1

:check_powershell
where powershell >nul 2>nul
if not errorlevel 1 (
    set "PWSH=powershell"
    exit /b 0
)
where pwsh >nul 2>nul
if not errorlevel 1 (
    set "PWSH=pwsh"
    exit /b 0
)
echo No se encontro PowerShell en este sistema. No se puede continuar.
pause
exit /b 1

:install
call :check_powershell
if errorlevel 1 exit /b 1

if not exist "%SETTINGS_DIR%" mkdir "%SETTINGS_DIR%"

%PWSH% -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $bytes=[System.Convert]::FromBase64String('%VERBS_B64%'); $verbsRaw=[System.Text.Encoding]::UTF8.GetString($bytes); $verbs=$verbsRaw -split '\|'; $spinnerVerbs=[pscustomobject]@{mode='replace';verbs=$verbs}; $settingsPath='%SETTINGS_FILE%'; if (Test-Path $settingsPath) { $raw=Get-Content -Raw -Path $settingsPath -Encoding UTF8; if ([string]::IsNullOrWhiteSpace($raw)) { $settings=[pscustomobject]@{} } else { try { $settings=$raw|ConvertFrom-Json } catch { Write-Host ('settings.json invalido en '+$settingsPath+', no se modifico nada') -ForegroundColor Red; exit 1 } }; $backup=$settingsPath+'.bak-'+(Get-Date -Format 'yyyyMMddHHmmss'); Copy-Item -Path $settingsPath -Destination $backup -Force; Write-Host ('Respaldo creado en: '+$backup) } else { $settings=[pscustomobject]@{} }; if ($settings.PSObject.Properties.Name -contains 'spinnerVerbs') { $settings.spinnerVerbs=$spinnerVerbs } else { $settings|Add-Member -MemberType NoteProperty -Name 'spinnerVerbs' -Value $spinnerVerbs }; $json=$settings|ConvertTo-Json -Depth 20; [System.IO.File]::WriteAllText($settingsPath,$json,(New-Object System.Text.UTF8Encoding($false))); Write-Host ('Listo. '+$verbs.Count+' verbos aplicados en: '+$settingsPath) -ForegroundColor Green"

if errorlevel 1 (
    echo.
    echo La instalacion fallo. Revisa el mensaje de arriba.
    pause
    exit /b 1
)

echo.
echo Cierra tu sesion de Claude Code y abre una nueva para ver los verbos.
pause
exit /b 0

:uninstall
if not exist "%SETTINGS_FILE%" (
    echo No existe %SETTINGS_FILE%. Nada que desinstalar.
    pause
    exit /b 0
)

call :check_powershell
if errorlevel 1 exit /b 1

%PWSH% -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $settingsPath='%SETTINGS_FILE%'; $raw=Get-Content -Raw -Path $settingsPath -Encoding UTF8; if ([string]::IsNullOrWhiteSpace($raw)) { Write-Host 'El archivo esta vacio, nada que desinstalar.'; exit 0 }; try { $settings=$raw|ConvertFrom-Json } catch { Write-Host ('settings.json invalido en '+$settingsPath+', no se modifico nada') -ForegroundColor Red; exit 1 }; if (-not ($settings.PSObject.Properties.Name -contains 'spinnerVerbs')) { Write-Host 'El Pack Jalapeno no esta instalado (no hay spinnerVerbs en tu settings.json).'; exit 0 }; $backup=$settingsPath+'.bak-'+(Get-Date -Format 'yyyyMMddHHmmss'); Copy-Item -Path $settingsPath -Destination $backup -Force; Write-Host ('Respaldo creado en: '+$backup); $settings.PSObject.Properties.Remove('spinnerVerbs'); $json=$settings|ConvertTo-Json -Depth 20; [System.IO.File]::WriteAllText($settingsPath,$json,(New-Object System.Text.UTF8Encoding($false))); Write-Host ('Listo. Se quito spinnerVerbs de: '+$settingsPath) -ForegroundColor Green"

if errorlevel 1 (
    echo.
    echo La desinstalacion fallo. Revisa el mensaje de arriba.
    pause
    exit /b 1
)

echo.
echo Cierra tu sesion de Claude Code y abre una nueva.
pause
exit /b 0

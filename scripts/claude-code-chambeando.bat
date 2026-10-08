@echo off
rem Claude Code Chambeando v0.2 - Windows
rem github.com/aderegil/claude-code-chambeando
rem Doble clic para abrir. Todo el codigo es el PowerShell de abajo, en claro.
rem Edita ~/.claude/settings.json (spinnerVerbs) sin tocar el resto de tu configuracion.
chcp 65001 >nul 2>&1
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$t=[IO.File]::ReadAllText('%~f0',[Text.Encoding]::UTF8); $m=':::'+'PS'; Invoke-Expression $t.Substring($t.LastIndexOf($m)+$m.Length)"
exit /b
:::PS
$ErrorActionPreference = 'Stop'
$host.UI.RawUI.WindowTitle = 'Claude Code Chambeando v0.2'
$settingsDir  = Join-Path $HOME '.claude'
$settingsPath = Join-Path $settingsDir 'settings.json'
$utf8 = New-Object System.Text.UTF8Encoding($false)

# Un verbo por linea. Edita libremente.
$verbs = @(
    'Achicharrándose',
    'Achicopalándose',
    'Acicalando',
    'Acomidiéndose',
    'Agüitándose',
    'Aguantando tantito',
    'Ahí la llevo',
    'Ahorita mero queda',
    'Ahorita queda',
    'Ahoritita queda',
    'Albureando',
    'Alebrestándose',
    'Alebrijeando',
    'Amarrando cabos',
    'Antojándose',
    'Apachurrando teclas',
    'Apantallando',
    'Apapachando',
    'Apechugando',
    'Apurándose',
    'Argüendeando',
    'Arrullando',
    'Asoleándose',
    'Atascándose',
    'Balconeando',
    'Bendiciendo',
    'Birrieando',
    'Borloteando',
    'Botaneando',
    'Brincoteando',
    'Buscándole tres pies al gato',
    'Calaveriteando',
    'Calentando la silla',
    'Cantando Cielito Lindo',
    'Cantando El Rey',
    'Cantando Las Mañanitas',
    'Cantando México Lindo y Querido',
    'Cascareando',
    'Chachareando',
    'Chambeando',
    'Chancleando',
    'Chapulineando',
    'Charoleando',
    'Chichicuiloteando',
    'Chilaquileando',
    'Chismeando',
    'Cocinando a fuego lento',
    'Comadreando',
    'Combiando',
    'Compadreando',
    'Cortocircuiteándose',
    'Cotorreando',
    'Cuchicheando',
    'Cumbiando',
    'Dándole vuelo a la hilacha',
    'Desconchinflando',
    'Descubriendo el agua tibia',
    'Despelucando',
    'Echando aguas',
    'Echando carrilla',
    'Echando flojera',
    'Echando maromas',
    'Echando mosca',
    'Echando palomazo',
    'Echando un volado',
    'Echándole ganas',
    'Echándole guacamole',
    'Echándole limón',
    'Echándose flores solito',
    'Echándose un clavado',
    'Echándose un coyotito',
    'Echándose un taco',
    'En un ratito queda',
    'Encariñándose',
    'Encarrerándose',
    'Encomendándose a San Judas',
    'Encomendándose a La Virgencita',
    'Encontrándole el modo',
    'Escombrando',
    'Faroleando',
    'Franeleando',
    'Godineando',
    'Gorreando',
    'Haciendo el jale',
    'Haciendo el paro',
    'Haciendo sopes',
    'Haciéndose guaje',
    'Haciéndose pato',
    'Hecho bolas',
    'Inventando el hilo negro',
    'Inventando la rueda',
    'Itacateando',
    'Jalando',
    'Jalando parejo',
    'Jineteando',
    'Jugando Lotería',
    'Jurando que no pica',
    'La última y nos vamos',
    'Llevando serenata',
    'Luchando',
    'Madrugándole',
    'Mañaniteando',
    'Mangoneando',
    'Mariacheando',
    'Metiendo la pata',
    'Mitoteando',
    'Mixioteando',
    'Molcajeteando',
    'Ninguneando',
    'No eres tú, soy yo',
    'No rajándose',
    'Ofrendando',
    'Pajareando',
    'Palomeando',
    'Partiendo la rosca',
    'Pastoreando',
    'Patinándole el coco',
    'Payaseando',
    'Peregrinando',
    'Peregrinando a la Villa',
    'Persignándose tres veces',
    'Pesereando',
    'Pidiendo posada',
    'Pisteando',
    'Pizcando',
    'Planchando oreja',
    'Poniéndole frijolitos',
    'Poniéndose las pilas',
    'Pozoleando',
    'Puebleando',
    'Quesadilleando',
    'Quincenando',
    'Recalentando',
    'Refresqueando',
    'Regándola bonito',
    'Regateando',
    'Relajeando',
    'Renegando',
    'Respingando',
    'Rifándosela',
    'Ruleteando',
    'Sacando chispas',
    'Sacando la casta',
    'Sacando la chamba',
    'Sacándole punta',
    'Sacándolo adelante',
    'Salseando',
    'Sazonando',
    'Sonideando',
    'Talacheando',
    'Tamaleando',
    'Taqueando',
    'Tarareando La Cucaracha',
    'Tarareando La Llorona',
    'Tatemando',
    'Tianguiseando',
    'Tocando madera',
    'Torteando',
    'Tramando',
    'Turisteando',
    'Vacilando',
    'Volteando la tortilla',
    'Voy en chinga',
    'Ya casi queda',
    'Ya merito'
)

function Say($texto, $color) { Write-Host ("  " + $texto) -ForegroundColor $color }

Clear-Host
Write-Host ''
Say '===========================================' DarkYellow
Say ' Claude Code Chambeando v0.2' Yellow
Say ' github.com/aderegil/claude-code-chambeando' DarkGray
Say '===========================================' DarkYellow
Write-Host ''
Say 'Agrega verbos en español mexicano al' White
Say 'spinner de carga de Claude Code.' White
Write-Host ''
Say $settingsPath DarkGray
Write-Host ''
Say '===========================================' DarkYellow
Write-Host ''
Say '[1] Instalar' Green
Say '[2] Desinstalar' Red
Say '[3] Salir' Gray
Write-Host ''
$opcion = Read-Host '  Elige una opción'
Write-Host ''

function Leer-Settings {
    $texto = [IO.File]::ReadAllText($settingsPath, $utf8).TrimStart([char]0xFEFF)
    if ($texto.Trim() -eq '') { return [PSCustomObject]@{} }
    $obj = $texto | ConvertFrom-Json
    if ($obj -isnot [PSCustomObject]) { throw 'formato' }
    return $obj
}
function Guardar-Settings($obj) {
    [IO.File]::WriteAllText($settingsPath, (($obj | ConvertTo-Json -Depth 20) + "`n"), $utf8)
}

try {
    switch ($opcion) {
        '1' {
            if (-not (Test-Path $settingsDir)) { New-Item -ItemType Directory -Path $settingsDir | Out-Null }
            $s = [PSCustomObject]@{}
            if (Test-Path $settingsPath) {
                try { $s = Leer-Settings }
                catch {
                    Copy-Item $settingsPath ($settingsPath + '.bak') -Force
                    Say 'settings.json no era JSON válido; se respaldó en settings.json.bak' Yellow
                }
            }
            $sv = [PSCustomObject]@{ mode = 'replace'; verbs = $verbs }
            if ($s.PSObject.Properties['spinnerVerbs']) { $s.spinnerVerbs = $sv }
            else { $s | Add-Member -MemberType NoteProperty -Name spinnerVerbs -Value $sv }
            Guardar-Settings $s
            Say 'Listo. Claude Code Chambeando instalado.' Green
            Say 'Reinicia Claude Code para ver los cambios.' Yellow
        }
        '2' {
            if (-not (Test-Path $settingsPath)) {
                Say 'No se encontró settings.json. Nada que desinstalar.' Yellow
            } else {
                try { $s = Leer-Settings } catch { Say 'Error al leer settings.json.' Red; $s = $null }
                if ($s) {
                    if ($s.PSObject.Properties['spinnerVerbs']) {
                        $s.PSObject.Properties.Remove('spinnerVerbs')
                        Guardar-Settings $s
                        Say 'Claude Code Chambeando desinstalado.' Green
                        Say 'Reinicia Claude Code para ver los cambios.' Yellow
                    } else {
                        Say 'No estaba instalado. No se hizo ningún cambio.' Yellow
                    }
                }
            }
        }
        '3' { Say 'Hasta luego.' Gray }
        default { Say 'Opción no válida.' Red }
    }
} catch {
    Say ('Error: ' + $_.Exception.Message) Red
}
Write-Host ''
Read-Host '  Presiona Enter para cerrar' | Out-Null

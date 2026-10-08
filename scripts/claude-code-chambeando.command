#!/bin/bash
# Claude Code Chambeando v0.2 — versión macOS
# github.com/aderegil/claude-code-chambeando
#
# Doble clic en Finder para abrirlo en Terminal.
# Agrega (o quita) verbos en español mexicano al spinner de Claude Code
# editando ~/.claude/settings.json sin tocar el resto de tu configuración.
# No requiere Python ni Node: usa osascript (JavaScript), que viene con macOS.

SETTINGS_DIR="$HOME/.claude"
SETTINGS_PATH="$SETTINGS_DIR/settings.json"

# Un verbo por línea. Edita libremente.
read -r -d '' CHAMBEANDO_VERBOS <<'VERBOS'
Achicharrándose
Achicopalándose
Acicalando
Acomidiéndose
Agüitándose
Aguantando tantito
Ahí la llevo
Ahorita mero queda
Ahorita queda
Ahoritita queda
Albureando
Alebrestándose
Alebrijeando
Amarrando cabos
Antojándose
Apachurrando teclas
Apantallando
Apapachando
Apechugando
Apurándose
Argüendeando
Arrullando
Asoleándose
Atascándose
Balconeando
Bendiciendo
Birrieando
Borloteando
Botaneando
Brincoteando
Buscándole tres pies al gato
Calaveriteando
Calentando la silla
Cantando Cielito Lindo
Cantando El Rey
Cantando Las Mañanitas
Cantando México Lindo y Querido
Cascareando
Chachareando
Chambeando
Chancleando
Chapulineando
Charoleando
Chichicuiloteando
Chilaquileando
Chismeando
Cocinando a fuego lento
Comadreando
Combiando
Compadreando
Cortocircuiteándose
Cotorreando
Cuchicheando
Cumbiando
Dándole vuelo a la hilacha
Desconchinflando
Descubriendo el agua tibia
Despelucando
Echando aguas
Echando carrilla
Echando flojera
Echando maromas
Echando mosca
Echando palomazo
Echando un volado
Echándole ganas
Echándole guacamole
Echándole limón
Echándose flores solito
Echándose un clavado
Echándose un coyotito
Echándose un taco
En un ratito queda
Encariñándose
Encarrerándose
Encomendándose a San Judas
Encomendándose a La Virgencita
Encontrándole el modo
Escombrando
Faroleando
Franeleando
Godineando
Gorreando
Haciendo el jale
Haciendo el paro
Haciendo sopes
Haciéndose guaje
Haciéndose pato
Hecho bolas
Inventando el hilo negro
Inventando la rueda
Itacateando
Jalando
Jalando parejo
Jineteando
Jugando Lotería
Jurando que no pica
La última y nos vamos
Llevando serenata
Luchando
Madrugándole
Mañaniteando
Mangoneando
Mariacheando
Metiendo la pata
Mitoteando
Mixioteando
Molcajeteando
Ninguneando
No eres tú, soy yo
No rajándose
Ofrendando
Pajareando
Palomeando
Partiendo la rosca
Pastoreando
Patinándole el coco
Payaseando
Peregrinando
Peregrinando a la Villa
Persignándose tres veces
Pesereando
Pidiendo posada
Pisteando
Pizcando
Planchando oreja
Poniéndole frijolitos
Poniéndose las pilas
Pozoleando
Puebleando
Quesadilleando
Quincenando
Recalentando
Refresqueando
Regándola bonito
Regateando
Relajeando
Renegando
Respingando
Rifándosela
Ruleteando
Sacando chispas
Sacando la casta
Sacando la chamba
Sacándole punta
Sacándolo adelante
Salseando
Sazonando
Sonideando
Talacheando
Tamaleando
Taqueando
Tarareando La Cucaracha
Tarareando La Llorona
Tatemando
Tianguiseando
Tocando madera
Torteando
Tramando
Turisteando
Vacilando
Volteando la tortilla
Voy en chinga
Ya casi queda
Ya merito
VERBOS
export CHAMBEANDO_VERBOS

AMARILLO_OSC=$'\033[33m'; AMARILLO=$'\033[93m'; GRIS_OSC=$'\033[90m'
BLANCO=$'\033[97m'; VERDE=$'\033[92m'; ROJO=$'\033[91m'; GRIS=$'\033[37m'; RESET=$'\033[0m'
linea() { printf '  %s%s%s\n' "$1" "$2" "$RESET"; }

pausa() {
    echo
    read -n 1 -s -r -p "  Presiona cualquier tecla para cerrar..."
    echo
}

# Toda la lectura/escritura de JSON se hace aquí, con el motor JavaScript de macOS.
editar_settings() {
    osascript -l JavaScript - "$1" "$SETTINGS_PATH" <<'JXA'
ObjC.import('Foundation');
function run(argv) {
    var accion = argv[0], ruta = argv[1];
    var fm = $.NSFileManager.defaultManager;
    var existe = fm.fileExistsAtPath(ruta);

    function leer() {
        var s = $.NSString.stringWithContentsOfFileEncodingError(ruta, $.NSUTF8StringEncoding, null);
        if (s.isNil()) throw new Error('lectura');
        var texto = ObjC.unwrap(s).replace(/^﻿/, '');
        if (texto.trim() === '') return {};
        var obj = JSON.parse(texto);
        if (obj === null || typeof obj !== 'object' || Array.isArray(obj)) throw new Error('formato');
        return obj;
    }
    function escribir(obj) {
        var ok = $(JSON.stringify(obj, null, 2) + '\n')
            .writeToFileAtomicallyEncodingError(ruta, true, $.NSUTF8StringEncoding, null);
        if (!ok) throw new Error('escritura');
    }

    if (accion === 'instalar') {
        var env = $.NSProcessInfo.processInfo.environment;
        var verbos = ObjC.unwrap(env.objectForKey('CHAMBEANDO_VERBOS'))
            .split('\n').map(function (v) { return v.trim(); })
            .filter(function (v) { return v.length > 0; });
        var obj = {}, estado = 'ok';
        if (existe) {
            try { obj = leer(); }
            catch (e) {
                var bak = ruta + '.bak';
                if (fm.fileExistsAtPath(bak)) fm.removeItemAtPathError(bak, null);
                fm.copyItemAtPathToPathError(ruta, bak, null);
                obj = {}; estado = 'respaldo';
            }
        }
        obj.spinnerVerbs = { mode: 'replace', verbs: verbos };
        escribir(obj);
        return estado;
    }

    if (accion === 'desinstalar') {
        if (!existe) return 'sinarchivo';
        var obj2;
        try { obj2 = leer(); } catch (e) { return 'errorlectura'; }
        if (!Object.prototype.hasOwnProperty.call(obj2, 'spinnerVerbs')) return 'noinstalado';
        delete obj2.spinnerVerbs;
        escribir(obj2);
        return 'ok';
    }
    return 'accioninvalida';
}
JXA
}

printf '\033]0;Claude Code Chambeando v0.2\007'
clear
echo
linea "$AMARILLO_OSC" "==========================================="
linea "$AMARILLO"     " Claude Code Chambeando v0.2"
linea "$GRIS_OSC"     " github.com/aderegil/claude-code-chambeando"
linea "$AMARILLO_OSC" "==========================================="
echo
linea "$BLANCO" "Agrega verbos en español mexicano al"
linea "$BLANCO" "spinner de carga de Claude Code."
echo
linea "$GRIS_OSC" "$SETTINGS_PATH"
echo
linea "$AMARILLO_OSC" "==========================================="
echo
linea "$VERDE" "[1] Instalar"
linea "$ROJO"  "[2] Desinstalar"
linea "$GRIS"  "[3] Salir"
echo
read -r -p "  Elige una opción: " opcion
echo

case "$opcion" in
    1)
        mkdir -p "$SETTINGS_DIR"
        if ! resultado=$(editar_settings instalar 2>&1); then
            linea "$ROJO" "Error al escribir settings.json:"
            linea "$GRIS_OSC" "$resultado"
        else
            if [ "$resultado" = "respaldo" ]; then
                linea "$AMARILLO" "settings.json no era JSON válido; se respaldó en settings.json.bak"
            fi
            linea "$VERDE"   "Listo. Claude Code Chambeando instalado."
            linea "$AMARILLO" "Reinicia Claude Code para ver los cambios."
        fi
        ;;
    2)
        resultado=$(editar_settings desinstalar 2>&1)
        case "$resultado" in
            ok)
                linea "$VERDE"   "Claude Code Chambeando desinstalado."
                linea "$AMARILLO" "Reinicia Claude Code para ver los cambios." ;;
            sinarchivo)   linea "$AMARILLO" "No se encontró settings.json. Nada que desinstalar." ;;
            noinstalado)  linea "$AMARILLO" "No estaba instalado. No se hizo ningún cambio." ;;
            errorlectura) linea "$ROJO" "Error al leer settings.json." ;;
            *)            linea "$ROJO" "Error inesperado:"; linea "$GRIS_OSC" "$resultado" ;;
        esac
        ;;
    3) linea "$GRIS" "Hasta luego." ;;
    *) linea "$ROJO" "Opción no válida." ;;
esac

pausa

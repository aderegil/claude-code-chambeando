# Pack Jalapeño

165 verbos en gerundio en español de México para el spinner de Claude Code. Aptos para cualquier sala: cliente externo, demos formales, pantalla compartida.

## Cómo instalar

### 1. Verifica tu versión de Claude Code

```bash
claude --version
```

Necesitas v2.1.23 o superior. Si tienes versión más vieja, actualiza primero.

### 2. Elige el alcance y abre el `settings.json`

Hay dos lugares válidos según qué tan amplio quieras el cambio.

**Alcance de usuario (recomendado):** los verbos aplican a todos tus proyectos.

- macOS / Linux: `~/.claude/settings.json`
- Windows: `%USERPROFILE%\.claude\settings.json`

**Alcance de proyecto:** los verbos aplican solo al correr Claude Code dentro de ese repo. Útil si trabajas con equipos que prefieren los defaults en inglés.

- `<raíz-del-proyecto>/.claude/settings.json`

Si el archivo que elegiste no existe, créalo. Si existe pero ya tiene contenido, agrega solo la clave `spinnerVerbs` dentro del objeto principal.

### 3. Pega solo el bloque `spinnerVerbs`

Abre [`jalapeno.json`](jalapeno.json). Verás dos claves: `_meta` y `spinnerVerbs`.

**Copia solo el bloque `spinnerVerbs` completo, no `_meta`.** El bloque `_meta` es información del pack (autor, licencia, repo) que no le sirve a Claude Code y solo ensuciaría tu `settings.json`.

Tu `settings.json` debería verse así:

```json
{
  "spinnerVerbs": {
    "mode": "replace",
    "verbs": [
      "Achicharrándose",
      "Achicopalándose",
      "Acicalando",
      "...y 162 más"
    ]
  }
}
```

Si tu `settings.json` ya tiene otras claves, conserva todo y agrega `spinnerVerbs` como una clave hermana (separada por coma).

### 4. Reinicia Claude Code

Cierra la sesión y abre una nueva. La próxima vez que Claude esté pensando, verás los gerundios mexicanos.

### 5. Verifica que cargó

Pídele cualquier tarea que tarde unos segundos (leer un archivo grande, correr un script). El spinner debería mostrar uno de los verbos del pack.

Si sigues viendo verbos en inglés, revisa que:

1. El archivo `settings.json` esté en la ruta correcta.
2. El JSON sea válido (sin comas colgadas, comillas correctas).
3. Tu versión de Claude Code sea v2.1.23 o superior.
4. Reiniciaste la sesión después de editar el archivo.

## Cómo desactivar

No existe un modo `disable` oficial. Para volver al spinner en inglés:

1. Borra el bloque `spinnerVerbs` de tu `settings.json`.
2. Reinicia la sesión.

## Sobre el modo `replace`

`mode: "replace"` significa que tus verbos sustituyen completamente los del default en inglés. Si prefieres que se mezclen, cambia a `"append"`:

```json
"spinnerVerbs": {
  "mode": "append",
  "verbs": [...]
}
```

## Lista completa por categoría

### Música (11)

Cantando Cielito Lindo · Cantando El Rey · Cantando Las Mañanitas · Cantando México Lindo y Querido · Cumbiando · Echando palomazo · Llevando serenata · Mariacheando · Sonideando · Tarareando La Cucaracha · Tarareando La Llorona

### Gastronomía (26)

Antojándose · Atascándose · Birrieando · Botaneando · Chilaquileando · Cocinando a fuego lento · Echándole guacamole · Echándole limón · Echándose un taco · Haciendo sopes · Itacateando · Jurando que no pica · Mixioteando · Molcajeteando · Poniéndole frijolitos · Pozoleando · Quesadilleando · Recalentando · Refresqueando · Salseando · Sazonando · Tamaleando · Taqueando · Tatemando · Torteando · Volteando la tortilla

### Turismo (3)

Peregrinando · Puebleando · Turisteando

### Deporte (3)

Cascareando · Jineteando · Luchando

### Religión (10)

Bendiciendo · Calaveriteando · Encomendándose a La Virgencita · Encomendándose a San Judas · Mañaniteando · Ofrendando · Partiendo la rosca · Peregrinando a la Villa · Persignándose tres veces · Pidiendo posada

### Trabajo (41)

Acomidiéndose · Amarrando cabos · Apachurrando teclas · Apechugando · Calentando la silla · Chambeando · Charoleando · Combiando · Echando aguas · Echando maromas · Echándole ganas · Encarrerándose · Encontrándole el modo · Escombrando · Faroleando · Franeleando · Godineando · Gorreando · Haciendo el jale · Haciendo el paro · Jalando · Jalando parejo · Madrugándole · Mangoneando · Ninguneando · No rajándose · Palomeando · Pastoreando · Pesereando · Pizcando · Poniéndose las pilas · Quincenando · Rifándosela · Ruleteando · Sacando chispas · Sacando la casta · Sacando la chamba · Sacándole punta · Sacándolo adelante · Talacheando · Tramando

### Amistades (16)

Albureando · Argüendeando · Borloteando · Chachareando · Chismeando · Comadreando · Cotorreando · Cuchicheando · Echando carrilla · Jugando Lotería · La última y nos vamos · Mitoteando · Payaseando · Pisteando · Relajeando · Vacilando

### Naturaleza (2)

Achicharrándose · Asoleándose

### Familia (7)

Acicalando · Apapachando · Arrullando · Chancleando · Compadreando · Despelucando · Encariñándose

### Popular (36)

Achicopalándose · Agüitándose · Alebrestándose · Alebrijeando · Apantallando · Balconeando · Brincoteando · Buscándole tres pies al gato · Chapulineando · Chichicuiloteando · Cortocircuiteándose · Dándole vuelo a la hilacha · Desconchinflando · Descubriendo el agua tibia · Echando flojera · Echando mosca · Echando un volado · Echándose flores solito · Echándose un clavado · Echándose un coyotito · Haciéndose guaje · Haciéndose pato · Hecho bolas · Inventando el hilo negro · Inventando la rueda · Metiendo la pata · No eres tú, soy yo · Pajareando · Patinándole el coco · Planchando oreja · Regándola bonito · Regateando · Renegando · Respingando · Tianguiseando · Tocando madera

### Avance (10)

Frases de "ya merito" — el clásico optimismo mexicano sobre el tiempo restante. Especialmente apropiadas para un spinner.

Aguantando tantito · Ahí la llevo · Ahorita mero queda · Ahorita queda · Ahoritita queda · Apurándose · En un ratito queda · Voy en chinga · Ya casi queda · Ya merito

## Novedades v0.2

De 135 a 165 verbos: **69 agregados, 39 retirados** (neto +30). Se estrenó la categoría **Avance** con las frases de "ya merito".

**Agregados (69)**

Aguantando tantito · Ahí la llevo · Ahorita mero queda · Ahorita queda · Ahoritita queda · Albureando · Apachurrando teclas · Apurándose · Atascándose · Buscándole tres pies al gato · Calentando la silla · Cantando Cielito Lindo · Cantando El Rey · Cantando México Lindo y Querido · Cascareando · Cocinando a fuego lento · Combiando · Cortocircuiteándose · Dándole vuelo a la hilacha · Descubriendo el agua tibia · Echando carrilla · Echando flojera · Echando maromas · Echando mosca · Echando un volado · Echándole guacamole · Echándose flores solito · Echándose un clavado · Echándose un coyotito · Echándose un taco · En un ratito queda · Encomendándose a La Virgencita · Encomendándose a San Judas · Godineando · Haciendo el jale · Haciendo sopes · Haciéndose guaje · Haciéndose pato · Hecho bolas · Inventando el hilo negro · Inventando la rueda · Jugando Lotería · Jurando que no pica · La última y nos vamos · Llevando serenata · Luchando · Mangoneando · Mariacheando · Metiendo la pata · No eres tú, soy yo · Partiendo la rosca · Patinándole el coco · Peregrinando a la Villa · Persignándose tres veces · Pesereando · Pisteando · Planchando oreja · Poniéndole frijolitos · Quincenando · Recalentando · Regándola bonito · Sacando chispas · Sacando la chamba · Tarareando La Cucaracha · Tianguiseando · Tocando madera · Voy en chinga · Ya casi queda · Ya merito

**Retirados (39)**

Acocoteando · Aguajándose · Aguzándose · Altareando · Amolando · Apolismándose · Cantando La Bamba · Cantando La Cucaracha · Carrilleando · Cascariteando · Chiflando El Cascabel · Ciscándose · Cobijando · Cocinándola · Consintiéndolo · Copaleando · Cuadrándola · Cuajándola · Esquiteando · Fregando · Guacamoleando · Hilando fino · Lazando · Llaveando · Lucheando · Manganeando · Mecateando · Palmeando tortillas · Pamboleando · Plancheando · Posadeando · Probando la sazón · Procesionando · Rifando · Rosqueando · Serenateando · Sopeando · Tortillando · Velando

Algunas formas se sustituyeron por una variante más idiomática (p. ej. `Cantando La Cucaracha` → `Tarareando La Cucaracha`, `Lucheando` → `Luchando`, `Plancheando` → `Planchando oreja`, `Rosqueando` → `Partiendo la rosca`).

## Bug conocido

En Linux, el `~/.claude/settings.json` a nivel de usuario a veces no carga (issue 23347 del repo de Claude Code). Workaround: usa `.claude/settings.json` por proyecto en su lugar.

## Comportamiento en estado completado

Claude Code conjuga los gerundios al pasado simple cuando termina una operación. En inglés muestra cosas como `Crunched for 1m 15s`. Para verbos en español el comportamiento exacto no está documentado. Lo más probable es que deje el gerundio sin conjugar y agregue `for [tiempo]`. Esto puede crear mezcla visual entre español e inglés en estado completado. Es limitación de Claude Code, no del pack.

---

claude-code-chambeando © 2026 Alfredo De Regil. Licencia CC BY-NC-ND 4.0.

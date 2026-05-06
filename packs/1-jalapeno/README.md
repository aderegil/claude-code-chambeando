# Pack Jalapeño

135 verbos en gerundio en español de México para el spinner de Claude Code. Aptos para cualquier sala: cliente externo, demos formales, pantalla compartida.

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
      "...y 132 más"
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

### Música (9)

Cantando La Bamba · Cantando La Cucaracha · Cantando Las Mañanitas · Chiflando El Cascabel · Cumbiando · Echando palomazo · Serenateando · Sonideando · Tarareando La Llorona

### Gastronomía (24)

Antojándose · Birrieando · Botaneando · Chilaquileando · Echándole limón · Esquiteando · Guacamoleando · Itacateando · Mixioteando · Molcajeteando · Palmeando tortillas · Pozoleando · Probando la sazón · Quesadilleando · Refresqueando · Salseando · Sazonando · Sopeando · Tamaleando · Taqueando · Tatemando · Torteando · Tortillando · Volteando la tortilla

### Turismo (3)

Peregrinando · Puebleando · Turisteando

### Deporte (8)

Cascariteando · Jineteando · Lazando · Llaveando · Lucheando · Manganeando · Pamboleando · Plancheando

### Religión (11)

Altareando · Bendiciendo · Calaveriteando · Copaleando · Mañaniteando · Ofrendando · Pidiendo posada · Posadeando · Procesionando · Rosqueando · Velando

### Trabajo (35)

Acocoteando · Acomidiéndose · Aguzándose · Amarrando cabos · Apechugando · Chambeando · Charoleando · Cocinándola · Cuadrándola · Cuajándola · Echando aguas · Echándole ganas · Encarrerándose · Encontrándole el modo · Faroleando · Franeleando · Gorreando · Haciendo el paro · Hilando fino · Jalando · Jalando parejo · Madrugándole · Mecateando · No rajándose · Palomeando · Pastoreando · Pizcando · Poniéndose las pilas · Rifando · Rifándosela · Sacándole punta · Sacando la casta · Sacándolo adelante · Talacheando · Tramando

### Amistades (12)

Argüendeando · Borloteando · Carrilleando · Chismeando · Ciscándose · Comadreando · Cotorreando · Cuchicheando · Mitoteando · Payaseando · Relajeando · Vacilando

### Naturaleza (2)

Achicharrándose · Asoleándose

### Familia (9)

Acicalando · Apapachando · Arrullando · Chancleando · Cobijando · Compadreando · Consintiéndolo · Despelucando · Encariñándose

### Popular (22)

Achicopalándose · Aguajándose · Alebrestándose · Alebrijeando · Amolando · Apantallando · Apolismándose · Agüitándose · Balconeando · Brincoteando · Chachareando · Chapulineando · Chichicuiloteando · Desconchinflando · Escombrando · Fregando · Ninguneando · Pajareando · Regateando · Renegando · Respingando · Ruleteando

## Bug conocido

En Linux, el `~/.claude/settings.json` a nivel de usuario a veces no carga (issue 23347 del repo de Claude Code). Workaround: usa `.claude/settings.json` por proyecto en su lugar.

## Comportamiento en estado completado

Claude Code conjuga los gerundios al pasado simple cuando termina una operación. En inglés muestra cosas como `Crunched for 1m 15s`. Para verbos en español el comportamiento exacto no está documentado. Lo más probable es que deje el gerundio sin conjugar y agregue `for [tiempo]`. Esto puede crear mezcla visual entre español e inglés en estado completado. Es limitación de Claude Code, no del pack.

---

claude-code-chambeando © 2026 Alfredo De Regil. Licencia CC BY-NC-ND 4.0.

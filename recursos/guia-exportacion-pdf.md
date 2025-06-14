# Guía de Exportación a PDF

Esta guía explica cómo convertir el material del taller de micro:bit a formato PDF para su distribución e impresión.

## Opción 1: Usando Pandoc (Recomendado)

### Instalación de Pandoc
```bash
# En macOS
brew install pandoc

# En Ubuntu/Debian
sudo apt-get install pandoc

# En Windows
# Descargar desde https://pandoc.org/installing.html
```

### Exportación básica
```bash
# Convertir un ejercicio individual
pandoc ejercicios/01-introduccion-makecode.md -o ejercicio1.pdf

# Convertir todo el taller en un solo PDF
pandoc README.md ejercicios/*.md -o taller-microbit-completo.pdf
```

### Exportación con estilo mejorado
```bash
# Con márgenes y formato mejorado
pandoc README.md ejercicios/*.md \
  -o taller-microbit-completo.pdf \
  --pdf-engine=xelatex \
  -V geometry:margin=2cm \
  -V fontsize=12pt \
  -V documentclass=article \
  --highlight-style=tango
```

## Opción 2: Usando Markdown to PDF (Node.js)

### Instalación
```bash
npm install -g md-to-pdf
```

### Uso
```bash
# Convertir archivo individual
md-to-pdf ejercicios/01-introduccion-makecode.md

# Con configuración personalizada
md-to-pdf ejercicios/01-introduccion-makecode.md \
  --config-file recursos/pdf-config.json
```

### Archivo de configuración (pdf-config.json)
```json
{
  "pdf_options": {
    "format": "A4",
    "margin": {
      "top": "2cm",
      "bottom": "2cm",
      "left": "2cm",
      "right": "2cm"
    }
  },
  "stylesheet": "recursos/estilo-pdf.css"
}
```

## Opción 3: Usando GitBook

### Configuración
1. Crear un archivo `book.json`:
```json
{
  "title": "Taller de micro:bit",
  "description": "Tutorial de programación para niños",
  "language": "es",
  "structure": {
    "readme": "README.md",
    "summary": "SUMMARY.md"
  }
}
```

2. Crear `SUMMARY.md`:
```markdown
# Índice

* [Introducción](README.md)
* [Ejercicio 1: MakeCode](ejercicios/01-introduccion-makecode.md)
* [Ejercicio 2: Botones y caras](ejercicios/03-botones-caras.md)
* [Ejercicio 3: Acelerómetro](ejercicios/04-acelerometro.md)
* [Ejercicio 4: Piedra, papel, tijera](ejercicios/05-piedra-papel-tijera.md)
```

3. Generar PDF:
```bash
gitbook pdf . taller-microbit.pdf
```

## Opción 4: Usando Typora o Mark Text

Para usuarios menos técnicos:

1. Abrir cada archivo .md en Typora o Mark Text
2. Usar "Archivo" > "Exportar" > "PDF"
3. Combinar los PDFs usando herramientas online

## Preparación de imágenes

Antes de exportar a PDF:

1. **Reemplazar placeholders**: Sustituir todos los `[PLACEHOLDER: ...]` por imágenes reales
2. **Optimizar imágenes**: Redimensionar capturas a máximo 800px de ancho
3. **Formato consistente**: Usar PNG para capturas de pantalla

### Script para preparar imágenes
```bash
#!/bin/bash
# Redimensionar todas las imágenes en la carpeta imagenes/
for img in imagenes/*.png; do
  convert "$img" -resize 800x600> "$img"
done
```

## Consejos para mejor calidad PDF

### 1. Estructura de archivos
- Mantener un orden lógico en los nombres de archivo
- Usar encabezados consistentes (H1, H2, H3)
- Incluir saltos de página donde sea necesario

### 2. Formato de texto
- Usar listas numeradas para pasos
- Destacar conceptos importantes con **negrita**
- Usar bloques de código para ejemplos

### 3. Imágenes
- Incluir alt-text descriptivo
- Usar resolución suficiente (mínimo 150 DPI)
- Mantener aspect ratio original

## Ejemplo de comando completo

```bash
# Comando completo para generar PDF final
pandoc README.md ejercicios/*.md \
  -o "Taller_microbit_completo.pdf" \
  --pdf-engine=xelatex \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V mainfont="Arial" \
  -V documentclass=report \
  --highlight-style=tango \
  --table-of-contents \
  --toc-depth=2 \
  -M title="Taller de Programación micro:bit" \
  -M subtitle="Para niños de 8 a 12 años" \
  -M author="Tu Nombre" \
  -M date="$(date +'%B %Y')"
```

## Validación final

Antes de distribuir el PDF:

- [ ] Todas las imágenes se muestran correctamente
- [ ] Los enlaces internos funcionan
- [ ] El índice es preciso
- [ ] No hay texto cortado en los márgenes
- [ ] Los bloques de código están bien formateados
- [ ] Las listas y numeraciones son consistentes
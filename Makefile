# Makefile para generar PDF del Taller micro:bit

# Variables
TITLE = "Taller de Programación micro:bit"
SUBTITLE = "Para niños de 8 a 12 años"
AUTHOR = "Tu Nombre"
DATE = $(shell date +'%B %Y')
OUTPUT_DIR = output
PDF_NAME = taller-microbit-completo.pdf
PDF_INDIVIDUAL = taller-microbit-ejercicios-individuales

# Archivos fuente en orden (con portada)
SOURCES_WITH_COVER = portada.md \
                     README.md \
                     ejercicios/01-introduccion-makecode.md \
                     ejercicios/02-botones-caras.md \
                     ejercicios/03-acelerometro.md \
                     ejercicios/04-linterna-inteligente.md \
                     ejercicios/05-piano-magico.md \
                     ejercicios/06-piedra-papel-tijera.md

# Archivos fuente sin portada (para otros usos)
SOURCES = README.md \
          ejercicios/01-introduccion-makecode.md \
          ejercicios/02-botones-caras.md \
          ejercicios/03-acelerometro.md \
          ejercicios/04-linterna-inteligente.md \
          ejercicios/05-piano-magico.md \
          ejercicios/06-piedra-papel-tijera.md

# Configuración de mdpdf
MDPDF_OPTIONS = --border=2.5cm --format=A4 --gh-style

# Target por defecto
.PHONY: all
all: pdf

# Crear directorio de salida
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Generar PDF completo (con portada)
.PHONY: pdf
pdf: $(OUTPUT_DIR)
	@echo "🔄 Copiando imágenes al directorio de salida..."
	@cp -r imagenes $(OUTPUT_DIR)/
	@echo "🔄 Concatenando archivos markdown con portada..."
	@cat $(SOURCES_WITH_COVER) > $(OUTPUT_DIR)/taller-completo.md
	@echo "🔄 Generando PDF completo con mdpdf..."
	cd $(OUTPUT_DIR) && mdpdf taller-completo.md $(PDF_NAME) $(MDPDF_OPTIONS)
	@rm $(OUTPUT_DIR)/taller-completo.md
	@rm -rf $(OUTPUT_DIR)/imagenes
	@echo "✅ PDF completo generado: $(OUTPUT_DIR)/$(PDF_NAME)"

# Generar PDFs individuales
.PHONY: individual
individual: $(OUTPUT_DIR)
	@echo "🔄 Generando PDFs individuales..."
	mdpdf README.md $(OUTPUT_DIR)/00-introduccion.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/01-introduccion-makecode.md $(OUTPUT_DIR)/01-makecode-hola-mundo.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/02-botones-caras.md $(OUTPUT_DIR)/02-botones-caras.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/03-acelerometro.md $(OUTPUT_DIR)/03-acelerometro.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/04-linterna-inteligente.md $(OUTPUT_DIR)/04-linterna-inteligente.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/05-piano-magico.md $(OUTPUT_DIR)/05-piano-magico.pdf $(MDPDF_OPTIONS)
	mdpdf ejercicios/06-piedra-papel-tijera.md $(OUTPUT_DIR)/06-piedra-papel-tijera.pdf $(MDPDF_OPTIONS)
	@echo "✅ PDFs individuales generados en $(OUTPUT_DIR)/"

# Generar PDF básico (sin formato avanzado)
.PHONY: pdf-simple
pdf-simple: $(OUTPUT_DIR)
	@echo "🔄 Copiando imágenes al directorio de salida..."
	@cp -r imagenes $(OUTPUT_DIR)/
	@echo "🔄 Concatenando archivos markdown..."
	@cat $(SOURCES) > $(OUTPUT_DIR)/taller-simple.md
	@echo "🔄 Generando PDF simple..."
	cd $(OUTPUT_DIR) && mdpdf taller-simple.md taller-microbit-simple.pdf
	@rm $(OUTPUT_DIR)/taller-simple.md
	@rm -rf $(OUTPUT_DIR)/imagenes
	@echo "✅ PDF simple generado: $(OUTPUT_DIR)/taller-microbit-simple.pdf"

# Generar versión para instructor (incluye CLAUDE.md y portada)
.PHONY: instructor
instructor: $(OUTPUT_DIR)
	@echo "🔄 Copiando imágenes al directorio de salida..."
	@cp -r imagenes $(OUTPUT_DIR)/
	@echo "🔄 Concatenando archivos para instructor..."
	@cat portada.md CLAUDE.md $(SOURCES) recursos/guia-exportacion-pdf.md > $(OUTPUT_DIR)/taller-instructor.md
	@echo "🔄 Generando versión para instructor..."
	cd $(OUTPUT_DIR) && mdpdf taller-instructor.md taller-microbit-instructor.pdf $(MDPDF_OPTIONS)
	@rm $(OUTPUT_DIR)/taller-instructor.md
	@rm -rf $(OUTPUT_DIR)/imagenes
	@echo "✅ Versión instructor generada: $(OUTPUT_DIR)/taller-microbit-instructor.pdf"

# Verificar que mdpdf está instalado
.PHONY: check-deps
check-deps:
	@command -v npm >/dev/null 2>&1 || { echo "❌ Error: npm no está instalado. Instala Node.js desde: https://nodejs.org"; exit 1; }
	@command -v mdpdf >/dev/null 2>&1 || { echo "❌ Error: mdpdf no está instalado. Instálalo con: npm install -g mdpdf"; exit 1; }
	@echo "✅ Dependencias verificadas"

# Limpiar archivos generados
.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)
	@echo "🧹 Archivos generados eliminados"

# Mostrar ayuda
.PHONY: help
help:
	@echo "📚 Makefile del Taller micro:bit"
	@echo ""
	@echo "Targets disponibles:"
	@echo "  pdf          - Generar PDF completo del taller (por defecto)"
	@echo "  individual   - Generar PDFs individuales por ejercicio"
	@echo "  pdf-simple   - Generar PDF básico sin formato avanzado"
	@echo "  instructor   - Generar versión para el instructor"
	@echo "  check-deps   - Verificar dependencias (npm, mdpdf)"
	@echo "  install-mdpdf - Instalar mdpdf globalmente"
	@echo "  clean        - Eliminar archivos generados"
	@echo "  help         - Mostrar esta ayuda"
	@echo ""
	@echo "Ejemplos:"
	@echo "  make install-mdpdf      # Instalar mdpdf primero"
	@echo "  make                    # Generar PDF completo"
	@echo "  make individual         # Generar ejercicios por separado"
	@echo "  make instructor         # Versión con guías para instructor"
	@echo "  make check-deps         # Verificar que tienes mdpdf instalado"

# Instalar mdpdf
.PHONY: install-mdpdf
install-mdpdf:
	@echo "📦 Instalando mdpdf..."
	@command -v npm >/dev/null 2>&1 || { echo "❌ Error: npm no está instalado. Instala Node.js desde: https://nodejs.org"; exit 1; }
	npm install -g mdpdf
	@echo "✅ mdpdf instalado correctamente"

# Instalar dependencias en macOS (Node.js)
.PHONY: install-deps-mac
install-deps-mac:
	@echo "📦 Instalando dependencias en macOS..."
	@command -v brew >/dev/null 2>&1 || { echo "❌ Homebrew no está instalado. Visita: https://brew.sh"; exit 1; }
	brew install node
	npm install -g mdpdf
	@echo "✅ Dependencias instaladas"

# Instalar dependencias en Ubuntu/Debian (Node.js)
.PHONY: install-deps-ubuntu
install-deps-ubuntu:
	@echo "📦 Instalando dependencias en Ubuntu/Debian..."
	sudo apt-get update
	sudo apt-get install -y nodejs npm
	npm install -g mdpdf
	@echo "✅ Dependencias instaladas"

# Target para desarrollo: regenerar PDF cuando cambien los archivos
.PHONY: watch
watch:
	@echo "👀 Vigilando cambios en archivos markdown..."
	@echo "⚠️  Necesitas 'entr' instalado: brew install entr"
	ls $(SOURCES) | entr make pdf

# Generar ejemplo de configuración CSS personalizada
.PHONY: css-template
css-template:
	@echo "🎨 Creando template de CSS personalizado..."
	@mkdir -p css
	@echo "/* Estilos personalizados para el PDF del taller */" > css/custom.css
	@echo "body {" >> css/custom.css
	@echo "    font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Arial, sans-serif;" >> css/custom.css
	@echo "    line-height: 1.6;" >> css/custom.css
	@echo "    color: #333;" >> css/custom.css
	@echo "}" >> css/custom.css
	@echo "" >> css/custom.css
	@echo "h1, h2, h3 {" >> css/custom.css
	@echo "    color: #2c3e50;" >> css/custom.css
	@echo "    page-break-after: avoid;" >> css/custom.css
	@echo "}" >> css/custom.css
	@echo "" >> css/custom.css
	@echo "h1 {" >> css/custom.css
	@echo "    border-bottom: 3px solid #3498db;" >> css/custom.css
	@echo "    padding-bottom: 10px;" >> css/custom.css
	@echo "}" >> css/custom.css
	@echo "" >> css/custom.css
	@echo "code {" >> css/custom.css
	@echo "    background-color: #f8f9fa;" >> css/custom.css
	@echo "    padding: 2px 6px;" >> css/custom.css
	@echo "    border-radius: 3px;" >> css/custom.css
	@echo "    font-family: \"SF Mono\", Consolas, monospace;" >> css/custom.css
	@echo "}" >> css/custom.css
	@echo "" >> css/custom.css
	@echo "img {" >> css/custom.css
	@echo "    max-width: 100%;" >> css/custom.css
	@echo "    height: auto;" >> css/custom.css
	@echo "    border: 1px solid #ddd;" >> css/custom.css
	@echo "    border-radius: 8px;" >> css/custom.css
	@echo "    box-shadow: 0 2px 8px rgba(0,0,0,0.1);" >> css/custom.css
	@echo "}" >> css/custom.css
	@echo "✅ Template CSS creado en css/custom.css"
	@echo "   Usa: mdpdf file.md --css css/custom.css --output file.pdf"
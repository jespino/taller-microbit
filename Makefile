# Makefile para generar PDF del Taller micro:bit

# Variables
TITLE = "Taller de Programación micro:bit"
SUBTITLE = "Para niños de 8 a 12 años"
AUTHOR = "Tu Nombre"
DATE = $(shell date +'%B %Y')
OUTPUT_DIR = output
PDF_NAME = taller-microbit-completo.pdf
PDF_INDIVIDUAL = taller-microbit-ejercicios-individuales

# Archivos fuente en orden
SOURCES = README.md \
          ejercicios/01-introduccion-makecode.md \
          ejercicios/02-botones-caras.md \
          ejercicios/03-acelerometro.md \
          ejercicios/04-linterna-inteligente.md \
          ejercicios/05-piano-magico.md \
          ejercicios/06-piedra-papel-tijera.md

# Comando base de pandoc
PANDOC_BASE = pandoc \
	--pdf-engine=xelatex \
	-V geometry:margin=2.5cm \
	-V fontsize=11pt \
	-V documentclass=report \
	--highlight-style=tango \
	--table-of-contents \
	--toc-depth=2 \
	-M title=$(TITLE) \
	-M subtitle=$(SUBTITLE) \
	-M author=$(AUTHOR) \
	-M date=$(DATE)

# Target por defecto
.PHONY: all
all: pdf

# Crear directorio de salida
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Generar PDF completo
.PHONY: pdf
pdf: $(OUTPUT_DIR)
	$(PANDOC_BASE) $(SOURCES) -o $(OUTPUT_DIR)/$(PDF_NAME)
	@echo "✅ PDF completo generado: $(OUTPUT_DIR)/$(PDF_NAME)"

# Generar PDFs individuales
.PHONY: individual
individual: $(OUTPUT_DIR)
	@echo "🔄 Generando PDFs individuales..."
	pandoc README.md -o $(OUTPUT_DIR)/00-introduccion.pdf -M title="Introducción al Taller"
	pandoc ejercicios/01-introduccion-makecode.md -o $(OUTPUT_DIR)/01-makecode-hola-mundo.pdf -M title="Ejercicio 1: MakeCode y Hola Mundo"
	pandoc ejercicios/02-botones-caras.md -o $(OUTPUT_DIR)/02-botones-caras.pdf -M title="Ejercicio 2: Botones y Caras"
	pandoc ejercicios/03-acelerometro.md -o $(OUTPUT_DIR)/03-acelerometro.pdf -M title="Ejercicio 3: Acelerómetro"
	pandoc ejercicios/04-linterna-inteligente.md -o $(OUTPUT_DIR)/04-linterna-inteligente.pdf -M title="Ejercicio 4: Linterna Inteligente"
	pandoc ejercicios/05-piano-magico.md -o $(OUTPUT_DIR)/05-piano-magico.pdf -M title="Ejercicio 5: Piano Mágico"
	pandoc ejercicios/06-piedra-papel-tijera.md -o $(OUTPUT_DIR)/06-piedra-papel-tijera.pdf -M title="Ejercicio 6: Piedra, Papel o Tijera"
	@echo "✅ PDFs individuales generados en $(OUTPUT_DIR)/"

# Generar PDF básico (sin formato avanzado)
.PHONY: pdf-simple
pdf-simple: $(OUTPUT_DIR)
	pandoc $(SOURCES) -o $(OUTPUT_DIR)/taller-microbit-simple.pdf
	@echo "✅ PDF simple generado: $(OUTPUT_DIR)/taller-microbit-simple.pdf"

# Generar versión para instructor (incluye CLAUDE.md)
.PHONY: instructor
instructor: $(OUTPUT_DIR)
	$(PANDOC_BASE) CLAUDE.md $(SOURCES) recursos/guia-exportacion-pdf.md \
		-o $(OUTPUT_DIR)/taller-microbit-instructor.pdf \
		-M title="Taller micro:bit - Guía del Instructor"
	@echo "✅ Versión instructor generada: $(OUTPUT_DIR)/taller-microbit-instructor.pdf"

# Verificar que pandoc está instalado
.PHONY: check-deps
check-deps:
	@command -v pandoc >/dev/null 2>&1 || { echo "❌ Error: pandoc no está instalado. Instálalo con: brew install pandoc"; exit 1; }
	@command -v xelatex >/dev/null 2>&1 || { echo "⚠️  Advertencia: xelatex no encontrado. Instala con: brew install --cask mactex"; }
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
	@echo "  check-deps   - Verificar dependencias (pandoc, xelatex)"
	@echo "  clean        - Eliminar archivos generados"
	@echo "  help         - Mostrar esta ayuda"
	@echo ""
	@echo "Ejemplos:"
	@echo "  make                    # Generar PDF completo"
	@echo "  make individual         # Generar ejercicios por separado"
	@echo "  make instructor         # Versión con guías para instructor"
	@echo "  make check-deps         # Verificar que tienes pandoc instalado"

# Instalar dependencias en macOS
.PHONY: install-deps-mac
install-deps-mac:
	@echo "📦 Instalando dependencias en macOS..."
	@command -v brew >/dev/null 2>&1 || { echo "❌ Homebrew no está instalado. Visita: https://brew.sh"; exit 1; }
	brew install pandoc
	brew install --cask mactex
	@echo "✅ Dependencias instaladas"

# Instalar dependencias en Ubuntu/Debian
.PHONY: install-deps-ubuntu
install-deps-ubuntu:
	@echo "📦 Instalando dependencias en Ubuntu/Debian..."
	sudo apt-get update
	sudo apt-get install -y pandoc texlive-xetex texlive-fonts-recommended
	@echo "✅ Dependencias instaladas"

# Target para desarrollo: regenerar PDF cuando cambien los archivos
.PHONY: watch
watch:
	@echo "👀 Vigilando cambios en archivos markdown..."
	@echo "⚠️  Necesitas 'entr' instalado: brew install entr"
	ls $(SOURCES) | entr make pdf
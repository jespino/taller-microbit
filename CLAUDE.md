# Directrices del Taller micro:bit

## Información General
- **Público objetivo**: Niños de 8 a 12 años
- **Idioma**: Español de España
- **Duración estimada**: 2-3 horas
- **Formato**: Tutorial práctico con ejercicios

## Estructura del Repositorio
El taller se construye con `wsbuilder`. Lee `AGENTS.md` para la sintaxis, los comandos y las reglas.
```
taller-microbit/
├── workshop.yaml          # Título, autor, datos de la portada, textos de la interfaz
├── AGENTS.md              # Instrucciones de wsbuilder para agentes
├── modules/
│   ├── index.md           # Texto de la página de inicio
│   ├── 01-introduccion-makecode.md
│   ├── 02-botones-caras.md
│   ├── 03-acelerometro.md
│   ├── 04-linterna-inteligente.md
│   ├── 05-piano-magico.md
│   ├── 06-piedra-papel-tijera.md
│   └── images/            # Capturas de pantalla y recursos visuales
└── dist/                  # Web generada (no editar, no se versiona)
```

## Objetivos de Aprendizaje
1. Familiarizarse con la plataforma MakeCode
2. Comprender conceptos básicos de programación visual
3. Aprender a usar los componentes básicos del micro:bit (LED, botones, acelerómetro)
4. Desarrollar pensamiento lógico y resolución de problemas

## Metodología
- **Aprender haciendo**: Cada concepto se acompaña de un ejercicio práctico
- **Progresión gradual**: De lo simple a lo complejo
- **Lenguaje adaptado**: Vocabulario y explicaciones apropiadas para la edad
- **Interactividad**: Ejercicios que motiven la experimentación

## Herramientas Necesarias
- Navegador web moderno
- Acceso a internet para usar makecode.microbit.org
- micro:bit (físico u opcional para simulación)
- Cable USB (si se usa micro:bit físico)

## Publicación
- `wsbuilder watch` para escribir con recarga en vivo
- `wsbuilder check` al terminar cualquier cambio, y corregir errores y avisos
- Cada push a `main` publica la web en GitHub Pages (`.github/workflows/deploy.yml`)

## Notas para el Instructor
- Revisar que todas las capturas de pantalla estén actualizadas
- Probar todos los ejercicios antes del taller
- Preparar respuestas para preguntas frecuentes
- Tener ejemplos adicionales para niños que terminen antes

## Placeholders de Imágenes
Todos los placeholders de imágenes siguen el formato:
`[PLACEHOLDER: Descripción de la captura de pantalla needed]`

Las imágenes deben guardarse en la carpeta `modules/images/` con nombres descriptivos.
# 🚀 Taller de Programación con micro:bit

Un taller para niños de 8 a 12 años: seis proyectos prácticos con MakeCode para aprender a
programar el micro:bit con bloques visuales.

**Léelo en la web:** https://jespino.github.io/taller-microbit/ · [English](https://jespino.github.io/taller-microbit/en/)

El contenido está en [`modules/`](modules/), un archivo por proyecto, y la web se genera
con [wsbuilder](https://github.com/jespino/wsbuilder):

```bash
go install github.com/jespino/wsbuilder/cmd/wsbuilder@latest

wsbuilder watch   # escribir con recarga en vivo en http://127.0.0.1:8000
wsbuilder check   # validar enlaces, imágenes y frontmatter
wsbuilder build   # generar la web en dist/
```

Cada push a `main` publica la web en GitHub Pages.

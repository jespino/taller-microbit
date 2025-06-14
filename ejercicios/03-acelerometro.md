# Ejercicio 3: ¡En Movimiento! - Usando el Acelerómetro

¡El micro:bit tiene un sensor súper chulo que puede detectar cuando lo mueves! Se llama acelerómetro, y en este ejercicio vas a aprender a usarlo.

## ¿Qué es un acelerómetro?

Un acelerómetro es como un sensor mágico que puede detectar:
- Si agitas el micro:bit
- Si lo inclinas hacia la izquierda o derecha
- Si lo pones boca abajo
- Si lo mueves bruscamente

¡Es el mismo sensor que tienen los móviles para girar la pantalla!

## ¿Qué vamos a hacer?

Vamos a crear un programa que:
1. **Al agitar** el micro:bit: muestre una cara mareada
2. **Al inclinar hacia la izquierda**: muestre una flecha hacia la izquierda
3. **Al inclinar hacia la derecha**: muestre una flecha hacia la derecha
4. **Normalmente**: muestre una cara normal

## Paso 1: Crear el proyecto

1. Crea un nuevo proyecto llamado "Detector de movimiento"
2. Primero vamos a poner una cara normal al empezar

En el bloque "al iniciar", añade un "mostrar LEDs" con esta cara:

```
. . . . .
. # . # .
. . . . .
# . . . #
. # # # .
```

![Bloque al iniciar con cara normal](../imagenes/03-al-iniciar-cara-normal.png)

[PLACEHOLDER: Captura del bloque "al iniciar" con la cara normal]

## Paso 2: Detectar cuando agitas el micro:bit

¡Vamos a hacer algo divertido cuando agites el micro:bit!

1. Ve a la categoría "Entrada" (roja)
2. Busca el bloque "al agitar"
3. Arrástralo al área de trabajo
4. Dentro, pon un "mostrar LEDs" con una cara mareada:

```
# . . . #
. # . # .
. . # . .
. # . # .
# . . . #
```

![Bloque al agitar con cara mareada](../imagenes/03-al-agitar-cara-mareada.png)

[PLACEHOLDER: Captura del bloque "al agitar" con la cara mareada]

## Paso 3: Detectar inclinación hacia la izquierda

Ahora vamos a hacer que aparezca una flecha cuando inclines el micro:bit.

1. En "Entrada", busca "al inclinar hacia la izquierda"
2. Arrástralo al área de trabajo
3. Añade un "mostrar LEDs" con una flecha hacia la izquierda:

```
. . # . .
. # # . .
# # # # #
. # # . .
. . # . .
```

![Bloque inclinar izquierda con flecha](../imagenes/03-inclinar-izquierda-flecha.png)

[PLACEHOLDER: Captura del bloque "al inclinar hacia la izquierda" con la flecha]

## Paso 4: Detectar inclinación hacia la derecha

¡Lo mismo para la derecha!

1. Añade "al inclinar hacia la derecha"
2. Pon una flecha hacia la derecha:

```
. . # . .
. . # # .
# # # # #
. . # # .
. . # . .
```

![Todos los bloques del acelerómetro](../imagenes/03-todos-bloques-acelerometro.png)

[PLACEHOLDER: Captura de todos los bloques juntos]

## Paso 5: ¡Prueba tu programa!

1. En el simulador, puedes simular los movimientos:
   - Haz clic en "SHAKE" para simular agitar
   - Haz clic en las flechas alrededor del micro:bit para simular inclinación

![Simulador controles de movimiento](../imagenes/03-simulador-controles-movimiento.png)

[PLACEHOLDER: Captura del simulador mostrando los controles de movimiento]

## ¡Vamos a mejorarlo!

### Añadir más direcciones

Puedes añadir más direcciones:
- "al inclinar hacia adelante"
- "al inclinar hacia atrás"
- "al poner con la pantalla hacia abajo"

### Añadir sonidos

¡Haz que cada movimiento tenga su sonido!

1. Ve a "Música" y añade "reproducir tono" después de cada "mostrar LEDs"
2. Usa tonos diferentes para cada movimiento:
   - Agitar: tono alto y rápido
   - Izquierda/derecha: tonos medios
   - Normal: tono suave

![Ejemplo con sonidos añadidos](../imagenes/03-ejemplo-con-sonidos.png)

[PLACEHOLDER: Captura de ejemplo con sonidos añadidos]

## Experimento divertido: Dados digitales

¡Vamos a crear unos dados que funcionen agitando el micro:bit!

1. Cambia el bloque "al agitar"
2. En lugar de mostrar una cara mareada, usa "mostrar número"
3. Ve a "Matemáticas" y busca "número al azar entre 1 y 6"
4. ¡Ahora cada vez que agites aparecerá un número del 1 al 6!

![Programa de dados digital](../imagenes/03-programa-dados-digital.png)

[PLACEHOLDER: Captura del programa de dados con "mostrar número" y "número al azar"]

## ¿Qué has aprendido?

- ✅ Qué es un acelerómetro y para qué sirve
- ✅ Cómo detectar diferentes tipos de movimiento
- ✅ Los bloques: "al agitar", "al inclinar"
- ✅ Cómo hacer un programa que responde al movimiento físico
- ✅ Cómo crear dados digitales

## Problemas comunes

**🤔 ¿No funciona al agitar?**
- En el simulador, asegúrate de hacer clic en "SHAKE"
- Si usas un micro:bit real, agítalo con más fuerza (¡pero con cuidado!)

**🤔 ¿Las inclinaciones no funcionan bien?**
- Inclina el micro:bit más claramente hacia un lado
- En el simulador, haz clic bien en las flechas de dirección

## Retos extra

1. **Contador de pasos**: Haz que cada vez que agites, aumente un número (como un podómetro)
2. **Alarma de movimiento**: Que suene una alarma cuando detecte movimiento
3. **Juego de equilibrio**: Que muestre "¡Bien!" solo cuando esté completamente plano

## ¿Preparado para el proyecto final?

¡Increíble! Has dominado los sensores del micro:bit. Ahora vamos a combinar todo lo que sabes para crear una linterna súper inteligente. Ve al [Ejercicio 4: Linterna Inteligente](04-linterna-inteligente.md).

---

**💡 Consejo:** El acelerómetro es muy sensible. Si tu programa reacciona demasiado, intenta movimientos más suaves. ¡Y si no reacciona suficiente, muévelo con más decisión!
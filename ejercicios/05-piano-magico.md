# Ejercicio 5: 🎵 Piano Mágico

¡Vamos a convertir tu micro:bit en un piano que puedes tocar con los botones! Podrás crear melodías, tocar canciones conocidas y hasta componer tu propia música.

## ¿Qué vamos a hacer?

Nuestro piano mágico tendrá:
- 🎹 **Botones como teclas**: A y B para tocar notas
- 🎼 **Diferentes escalas**: Mayor, menor, pentatónica
- 🎵 **Canciones pregrabadas**: Melodías famosas
- 🎶 **Modo compositor**: Graba y reproduce tus creaciones

## ¿Cómo funciona el sonido en micro:bit?

El micro:bit puede producir sonidos usando **frecuencias**. Cada nota musical tiene una frecuencia diferente:
- **Do** = 262 Hz
- **Re** = 294 Hz  
- **Mi** = 330 Hz
- **Fa** = 349 Hz
- **Sol** = 392 Hz
- **La** = 440 Hz
- **Si** = 494 Hz

¡Es como las cuerdas de una guitarra: más tensas = sonido más agudo!

[PLACEHOLDER: Imagen mostrando las notas musicales y sus frecuencias]

## Paso 1: Crear el proyecto

1. Crea un nuevo proyecto llamado "Piano Mágico"
2. Vamos a necesitar variables para controlar nuestro piano

### Crear variables:
1. Ve a "Variables" (naranja)
2. Crea una variable llamada "nota_actual"
3. Crea otra llamada "octava"
4. Crea una más llamada "modo_piano"

[PLACEHOLDER: Captura creando las variables del piano]

## Paso 2: Configuración inicial

En el bloque "al iniciar":

1. **Establecer nota_actual a 262** (empezamos en Do)
2. **Establecer octava a 1** (octava normal)
3. **Establecer modo_piano a 1** (modo básico)
4. **Mostrar ícono de música**
5. **Reproducir tono 262 Hz durante 500 ms** (Do de bienvenida)

[PLACEHOLDER: Captura del bloque "al iniciar" con la configuración]

## Paso 3: Programar las teclas básicas

¡Vamos a hacer que los botones toquen notas!

### Botón A - Nota Do:
```
al presionar botón A
    reproducir tono 262 Hz durante 300 ms
    mostrar LEDs:
    # . . . .
    # . . . .
    # . . . .
    # . . . .
    # . . . .
```

### Botón B - Nota Sol:
```
al presionar botón B
    reproducir tono 392 Hz durante 300 ms
    mostrar LEDs:
    . . . . #
    . . . . #
    . . . . #
    . . . . #
    . . . . #
```

[PLACEHOLDER: Captura de los bloques de botones A y B básicos]

## Paso 4: Añadir más notas con gestos

¡Vamos a usar los gestos para tener más notas!

### Al inclinar hacia la izquierda - Nota Mi:
```
al inclinar hacia la izquierda
    reproducir tono 330 Hz durante 300 ms
    mostrar LEDs:
    # . # . .
    # . # . .
    # . # . .
    # . # . .
    # . # . .
```

### Al inclinar hacia la derecha - Nota La:
```
al inclinar hacia la derecha
    reproducir tono 440 Hz durante 300 ms
    mostrar LEDs:
    . . # . #
    . . # . #
    . . # . #
    . . # . #
    . . # . #
```

### Al agitar - Nota Do aguda:
```
al agitar
    reproducir tono 523 Hz durante 300 ms
    mostrar LEDs:
    # # # # #
    # . . . #
    # . # . #
    # . . . #
    # # # # #
```

[PLACEHOLDER: Captura con todos los gestos y sus notas correspondientes]

## Paso 5: Tocar una canción simple

¡Vamos a programar "Cumpleaños Feliz"!

### Presionar A+B juntos para la canción:
```
al presionar A+B
    mostrar texto "CUMPLEANOS"
    
    // "Cum-ple-a-ños fe-liz"
    reproducir tono 262 Hz durante 400 ms  // Do
    reproducir tono 262 Hz durante 200 ms  // Do
    reproducir tono 294 Hz durante 400 ms  // Re
    reproducir tono 262 Hz durante 400 ms  // Do
    reproducir tono 349 Hz durante 400 ms  // Fa
    reproducir tono 330 Hz durante 800 ms  // Mi
    
    pausa 200 ms
    
    // "Cum-ple-a-ños fe-liz"
    reproducir tono 262 Hz durante 400 ms  // Do
    reproducir tono 262 Hz durante 200 ms  // Do
    reproducir tono 294 Hz durante 400 ms  // Re
    reproducir tono 262 Hz durante 400 ms  // Do
    reproducir tono 392 Hz durante 400 ms  // Sol
    reproducir tono 349 Hz durante 800 ms  // Fa
    
    mostrar ícono de corazón
```

[PLACEHOLDER: Captura del bloque A+B con la melodía de cumpleaños]

## Paso 6: Modo compositor (¡Extra divertido!)

¡Vamos a añadir un modo donde puedes grabar tu propia música!

### Cambiar modo con el logo:
```
al tocar el logo
    si modo_piano = 1 entonces
        establecer modo_piano a 2
        mostrar texto "COMPOSITOR"
    si no
        establecer modo_piano a 1
        mostrar texto "PIANO"
```

### Grabación simple (conceptual):
En lugar de grabar realmente, podemos hacer que cada nota dure más tiempo cuando estamos en modo compositor:

Modifica los bloques de botones para que incluyan:
```
si modo_piano = 2 entonces
    reproducir tono [frecuencia] Hz durante 600 ms
si no
    reproducir tono [frecuencia] Hz durante 300 ms
```

[PLACEHOLDER: Captura del sistema de modos con el logo]

## Paso 7: Escalas musicales

¡Añadamos diferentes tipos de escalas para sonar más profesional!

### Al inclinar hacia adelante - Escala menor (triste):
```
al inclinar hacia adelante
    mostrar texto "TRISTE"
    // Escala menor: Do - Re - Mib - Fa - Sol - Lab - Sib
    reproducir tono 262 Hz durante 300 ms  // Do
    reproducir tono 294 Hz durante 300 ms  // Re
    reproducir tono 311 Hz durante 300 ms  // Mib
    reproducir tono 349 Hz durante 300 ms  // Fa
    reproducir tono 392 Hz durante 300 ms  // Sol
    reproducir tono 415 Hz durante 300 ms  // Lab
    reproducir tono 466 Hz durante 300 ms  // Sib
    reproducir tono 523 Hz durante 500 ms  // Do
```

### Al inclinar hacia atrás - Escala alegre:
```
al inclinar hacia atrás
    mostrar texto "ALEGRE"
    // Escala mayor rápida
    reproducir tono 262 Hz durante 200 ms  // Do
    reproducir tono 294 Hz durante 200 ms  // Re
    reproducir tono 330 Hz durante 200 ms  // Mi
    reproducir tono 349 Hz durante 200 ms  // Fa
    reproducir tono 392 Hz durante 200 ms  // Sol
    reproducir tono 440 Hz durante 200 ms  // La
    reproducir tono 494 Hz durante 200 ms  // Si
    reproducir tono 523 Hz durante 400 ms  // Do
```

[PLACEHOLDER: Captura con las escalas musicales programadas]

## Paso 8: Efectos especiales

¡Vamos a añadir algunos efectos geniales!

### Efecto sirena:
```
función sirena
    repetir 5 veces
        para índice desde 200 hasta 800 paso 50
            reproducir tono índice Hz durante 50 ms
        para índice desde 800 hasta 200 paso -50
            reproducir tono índice Hz durante 50 ms
```

### Efecto R2-D2:
```
función robot
    repetir 3 veces
        reproducir tono número al azar entre 400 y 800 Hz durante 100 ms
        pausa 50 ms
```

Puedes llamar a estos efectos cuando presiones ciertos botones en secuencia.

[PLACEHOLDER: Captura de los efectos especiales]

## Paso 9: ¡Prueba tu piano!

1. **Presiona botón A**: ¿Suena Do?
2. **Presiona botón B**: ¿Suena Sol?
3. **Inclina el micro:bit**: ¿Suenan Mi y La?
4. **Agita**: ¿Suena Do agudo?
5. **Presiona A+B**: ¿Toca "Cumpleaños Feliz"?

[PLACEHOLDER: Captura del simulador mostrando cómo probar cada función]

## Canciones que puedes tocar

### Estrellita (Twinkle Twinkle):
- Do-Do-Sol-Sol-La-La-Sol
- Fa-Fa-Mi-Mi-Re-Re-Do

### Mary Had a Little Lamb:
- Mi-Re-Do-Re-Mi-Mi-Mi
- Re-Re-Re-Mi-Sol-Sol

### Happy Birthday (ya la programamos):
- Do-Do-Re-Do-Fa-Mi
- Do-Do-Re-Do-Sol-Fa

## ¿Qué has aprendido?

- ✅ Cómo funciona el sonido y las frecuencias
- ✅ Crear música con programación
- ✅ Usar múltiples entradas (botones, gestos, logo)
- ✅ Programar melodías paso a paso
- ✅ Diferentes escalas musicales
- ✅ Crear efectos de sonido

## Problemas comunes

**🤔 ¿No se oye nada?**
- Asegúrate de que el volumen del simulador está subido
- En micro:bit real, el sonido sale por los pines (conecta auriculares o altavoz)

**🤔 ¿Las notas suenan mal?**
- Revisa que las frecuencias son correctas (262 para Do, 392 para Sol, etc.)
- Verifica que la duración no sea demasiado corta (mínimo 100 ms)

**🤔 ¿La melodía va muy rápida o lenta?**
- Cambia los valores de duración en `reproducir tono`
- Añade pausas entre notas si es necesario

## Retos extra

1. **Compón tu propia canción**: Usa las notas para crear una melodía original
2. **Añade más octavas**: Multiplica las frecuencias por 2 para octavas altas
3. **Crea un metrónomo**: Un sonido constante para marcar el tiempo
4. **Piano de colores**: Cada nota muestra un patrón LED diferente

## ¿Preparado para el gran final?

¡Increíble! Has creado tu propio instrumento musical. Ahora vamos al proyecto final más complejo: ¡tu propio juego completo! Ve al [Ejercicio 6: Piedra, Papel o Tijera](06-piedra-papel-tijera.md).

---

**💡 Consejo musical:** Las mejores melodías combinan notas altas y bajas. ¡Experimenta con diferentes combinaciones y encuentra tu estilo único!
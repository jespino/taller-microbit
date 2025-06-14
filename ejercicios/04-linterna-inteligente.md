# Ejercicio 2: 🔦 Linterna Inteligente

¡Vamos a convertir tu micro:bit en una linterna súper inteligente que se enciende automáticamente cuando está oscuro y tiene modos especiales!

## ¿Qué vamos a hacer?

Nuestra linterna inteligente tendrá:
- 🌙 **Modo automático**: Se enciende cuando detecta oscuridad
- 🆘 **Modo SOS**: Envía señales de socorro en código morse
- 🕺 **Modo discoteca**: Luces que parpadean al ritmo
- 🔦 **Modo linterna normal**: Siempre encendida

## ¿Qué es el sensor de luz?

El micro:bit puede "ver" si hay luz o está oscuro usando su **sensor de luz**. ¡Es como si fuera un ojo electrónico! El sensor nos da un número:
- **0 = Muy oscuro** (como de noche)
- **255 = Muy brillante** (como al sol)

[PLACEHOLDER: Imagen del micro:bit mostrando dónde está el sensor de luz]

## Paso 1: Crear el proyecto

1. Crea un nuevo proyecto llamado "Linterna Inteligente"
2. Vamos a empezar con una variable para saber qué modo estamos usando

### Crear variables:
1. Ve a "Variables" (naranja)
2. Crea una variable llamada "modo"
3. Crea otra llamada "nivel_luz"

[PLACEHOLDER: Captura creando las variables]

## Paso 2: Configuración inicial

En el bloque "al iniciar":

1. **Establecer modo a 1** (empezamos en modo automático)
2. **Mostrar texto "LINTERNA"**
3. **Pausa de 1 segundo**
4. **Mostrar número** de la variable "modo"

[PLACEHOLDER: Captura del bloque "al iniciar" configurado]

## Paso 3: Programar el modo automático

¡Aquí viene la magia! Vamos a hacer que la linterna detecte cuando está oscuro.

1. Arrastra un bloque "para siempre" al área de trabajo
2. Dentro del "para siempre":

### Leer el sensor de luz:
```
establecer nivel_luz a nivel de luz
```

### Decidir si encender la linterna:
```
si modo = 1 entonces
    si nivel_luz < 100 entonces
        mostrar LEDs (todos encendidos)
    si no
        borrar pantalla
```

**Patrón de LEDs todos encendidos:**
```
# # # # #
# # # # #
# # # # #
# # # # #
# # # # #
```

[PLACEHOLDER: Captura del bloque "para siempre" con la lógica del modo automático]

## Paso 4: Cambiar de modo con el botón A

Vamos a poder cambiar entre diferentes modos:

1. Arrastra "al presionar botón A"
2. Programa el cambio de modo:

```
si modo = 4 entonces
    establecer modo a 1
si no
    cambiar modo por 1
mostrar número modo
```

Los modos serán:
- **1** = Automático
- **2** = SOS  
- **3** = Discoteca
- **4** = Linterna normal

[PLACEHOLDER: Captura del bloque del botón A para cambiar modos]

## Paso 5: Programar el modo SOS

¡El código SOS es súper importante para emergencias! En morse es: **···---···** (tres puntos, tres rayas, tres puntos)

Añade esta lógica dentro del "para siempre", después del modo 1:

```
si no si modo = 2 entonces
    // Tres puntos (cortos)
    repetir 3 veces
        mostrar LEDs (todos encendidos)
        pausa 200 ms
        borrar pantalla
        pausa 200 ms
    
    pausa 500 ms
    
    // Tres rayas (largas)  
    repetir 3 veces
        mostrar LEDs (todos encendidos)
        pausa 600 ms
        borrar pantalla
        pausa 200 ms
    
    pausa 500 ms
    
    // Tres puntos otra vez
    repetir 3 veces
        mostrar LEDs (todos encendidos)
        pausa 200 ms
        borrar pantalla
        pausa 200 ms
    
    pausa 2000 ms
```

[PLACEHOLDER: Captura del código SOS con los bloques de repetición]

## Paso 6: Modo discoteca

¡Ahora el modo más divertido! Luces que cambian de patrón rápidamente:

```
si no si modo = 3 entonces
    mostrar LEDs (patrón 1)
    pausa 200 ms
    mostrar LEDs (patrón 2)
    pausa 200 ms
    mostrar LEDs (patrón 3)
    pausa 200 ms
```

**Patrón 1 (cruz):**
```
. . # . .
. . # . .
# # # # #
. . # . .
. . # . .
```

**Patrón 2 (esquinas):**
```
# . . . #
. . . . .
. . # . .
. . . . .
# . . . #
```

**Patrón 3 (todo encendido):**
```
# # # # #
# # # # #
# # # # #
# # # # #
# # # # #
```

[PLACEHOLDER: Captura del modo discoteca con los tres patrones]

## Paso 7: Modo linterna normal

El más sencillo, siempre encendida:

```
si no
    mostrar LEDs (todos encendidos)
```

## Paso 8: ¡Añadir sonidos!

¡Vamos a hacer la linterna aún más genial con sonidos!

Para el **modo SOS**, añade sonidos después de cada patrón de luz:
- Puntos: `reproducir tono 1000 Hz durante 200 ms`
- Rayas: `reproducir tono 1000 Hz durante 600 ms`

Para el **modo discoteca**, añade diferentes tonos con cada patrón:
- Patrón 1: `reproducir tono 262 Hz durante 200 ms`
- Patrón 2: `reproducir tono 523 Hz durante 200 ms`  
- Patrón 3: `reproducir tono 1047 Hz durante 200 ms`

[PLACEHOLDER: Captura del programa completo con sonidos añadidos]

## Paso 9: ¡Prueba tu linterna!

1. **Prueba el modo automático**: Tapa el micro:bit con la mano para simular oscuridad
2. **Presiona botón A**: Para cambiar entre modos
3. **Modo SOS**: ¿Ves el patrón correcto? ···---···
4. **Modo discoteca**: ¡Debería parecer una fiesta de luces!

[PLACEHOLDER: Captura del simulador mostrando cómo probar cada modo]

## Mejoras extra

### Botón B para emergencia
Añade un "al presionar botón B" que vaya directamente al modo SOS:

```
establecer modo a 2
mostrar ícono de corazón
```

### Ajustar sensibilidad de luz
Si la linterna se enciende demasiado o muy poco, cambia el número 100 por:
- **50** para que sea más sensible (se enciende con poca oscuridad)
- **150** para que sea menos sensible (solo se enciende cuando esté muy oscuro)

### Modo arcoíris
¡Añade un quinto modo que cycle entre diferentes patrones de formas!

## ¿Qué has aprendido?

- ✅ Cómo usar el sensor de luz del micro:bit
- ✅ Programación con múltiples modos
- ✅ Qué es el código morse SOS
- ✅ Usar bucles "repetir" para patrones
- ✅ Combinar sensores con lógica condicional
- ✅ Crear efectos visuales con temporizaciones

## Problemas comunes

**🤔 ¿La linterna no se enciende automáticamente?**
- Prueba tapando completamente el micro:bit con las manos
- Ajusta el valor 100 a un número más alto (como 150)

**🤔 ¿El SOS va muy rápido o muy lento?**
- Cambia los valores de pausa: más números = más lento
- El SOS real: puntos 200ms, rayas 600ms

**🤔 ¿No cambia de modo?**
- Revisa que la variable "modo" se actualiza correctamente
- Asegúrate de que los números en las condiciones son correctos (1, 2, 3, 4)

## Usos reales

¡Tu linterna inteligente puede ser súper útil!

- 🏕️ **Acampada**: Linterna automática que se enciende cuando oscurece
- 🆘 **Emergencias**: Modo SOS si te pierdes
- 🎉 **Fiestas**: Modo discoteca para animar el ambiente
- 🔍 **Exploración**: Linterna normal para buscar cosas

## ¿Preparado para más diversión?

¡Genial! Ahora que dominas los sensores y los modos, vamos a hacer música con tu micro:bit en el [Ejercicio 5: Piano Mágico](05-piano-magico.md).

---

**💡 Consejo:** El código SOS real se usa en emergencias marítimas y de montaña. ¡Enseña a tus amigos este código, nunca sabes cuándo puede ser útil!
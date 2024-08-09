# Sebekdots 3.3.1 Sway Edition

![Sway_2024-08-08_23 54 31](https://github.com/user-attachments/assets/533c9c71-364a-4e59-ae5d-82336ceeaa85)
_Aspecto de Sway con Sebekdots 3.3.1_


![Sway_2024-08-08_23 54 45](https://github.com/user-attachments/assets/4bef33e8-fb92-42ea-90bb-11004bbd5be4)
_Selector de Temas de Waybar_


![Sway_2024-08-08_23 54 54](https://github.com/user-attachments/assets/7ce41396-a6ad-4c15-9985-d3a3bddd1a07)
_Selector de Wallpapers_


![Sway_2024-08-08_23 54 16](https://github.com/user-attachments/assets/3ef4e86d-d9e2-4e15-a5f2-28dbc9829f3a)
_Aspecto de los menús y el Centro de Notificaciones_

# Sebekdots 3.3.1 Sway Edition

Actualización de mis dotfiles para Sway, con un montón de cambios tanto en lo visual, como a nivel de funcionalidades:

- El menú de selección de temas de Waybar es más grande y participa completamente del script de cambio de wallpapers/esquema de colores
- El selector de wallpapers ahora es más rápido, con un sistema de precarga de thumbnails para agilizar el proceso de generación de imágenes
- La animación de cambio de wallpaper es un poco más rápida que antes
- La estructura de datos de Waybar ha sido adaptada para mejorar la adición de elementos en todos los temas  
- Todos los temas han sido mejorados, ahora hay espacios de trabajo persistentes, indicadores de espacios de trabajo en todos los temas, animaciones en el botón del menú de aplicaciones y centro de notificaciones, y transientes en cada botón de cada tema.
- Grimblast.sh para captura de pantalla, presionando Control + ImprPant toman una captura que se almacena en la carpeta /home/user/Imágenes/Capturas
- Script de actualizaciones mejorado, completamente en español
- Menú de Aplicaciones y Centro de Notificaciones con un borde contrastante con el fondo, que participa del cambio de colores generado por Pywal, y ambos poseen ahora el mismo fondo, con el mismo tono e intensidad.
- Swaync-git es el demonio de notificaciones: con este programa se corrige un error que había en el centro de notificaciones que causaba que apareciera un reproductor por duplicado. Los temás "Mínima" ahora pueden funcionar sin bugs.
- Eliminados los temas "Modular", la geometría de los temas desperdiciaba demasiado espacio en pantalla.
- Actualización del código de configuración de Sway, permitiendo el uso del touchpad (en el caso de las laptops) y permitiendo aceleración del movimiento del puntero del mouse.
- Indicadores en Pantalla con SwayOSD: una muy útil pieza de software que permite generar indicadores en pantalla cada vez que presiones CapsLock/NumLock/ScrollLock/Subir o bajar volumen/brillo de pantalla

## Pasos para instalar Sebekdots 3.3.1 Sway Edition

Visita la [Wiki](https://github.com/andrewsebek/Sebekdots-sway/wiki)

# Fuente "Neuropolitical"

https://www.dafont.com/neuropolitical.font 
Incluyo el archivo en mi repositorio para descarga

## Importante

Para que el selector de wallpapers funcione, crea la carpeta "Set" en /Imágenes/Wallpapers/ (tal cual con las mayúsculas) y coloca todos tus wallpapers allí. El selector de wallpapers te los mostrará con Rofi.


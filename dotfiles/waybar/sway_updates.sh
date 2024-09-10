#!/bin/bash

# Directorios
REPO_URL="https://github.com/andrewsebek/Sebekdots-sway"
REPO_DIR=$(mktemp -d) # Crear directorio temporal
DOTFILES_DIR="$HOME/dotfiles"
SWAY_CONFIG_DIR="$HOME/.config/sway"
SWAYNC_DIRS=("$HOME/dotfiles/arriba" "$HOME/dotfiles/abajo" "$HOME/dotfiles/izquierda")
CONFIG_DIR="$HOME/.config"

# Clonar el repositorio en el directorio temporal
git clone "$REPO_URL" "$REPO_DIR"

# Copiar solo archivos modificados o nuevos para cada componente

# 1. Actualizar configuración de Sway
rsync -av --update --progress "$REPO_DIR/.config/sway/" "$SWAY_CONFIG_DIR"

# 2. Actualizar Waybar y Sway Notification Center
for dir in "${SWAYNC_DIRS[@]}"; do
    rsync -av --update --progress "$REPO_DIR/dotfiles/$dir/" "$DOTFILES_DIR/$dir"
done

# 3. Actualizar Hyprlock si es necesario
rsync -av --update --progress "$REPO_DIR/.config/hypr/" "$CONFIG_DIR/hypr"

# 4. Kitty, Rofi, nwg-panel, wal/templates si hay actualizaciones
rsync -av --update --progress "$REPO_DIR/.config/kitty/" "$CONFIG_DIR/kitty"
rsync -av --update --progress "$REPO_DIR/.config/rofi/" "$CONFIG_DIR/rofi"
rsync -av --update --progress "$REPO_DIR/.config/nwg-panel/" "$CONFIG_DIR/nwg-panel"
rsync -av --update --progress "$REPO_DIR/.config/wal/templates/" "$CONFIG_DIR/wal/templates"

# Eliminar directorio temporal
rm -rf "$REPO_DIR"

echo "Actualización completa de Sebekdots-Sway"

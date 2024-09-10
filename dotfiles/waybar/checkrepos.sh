#!/bin/bash

# URLs de los repositorios
REPO_URL_SWAY="https://github.com/andrewsebek/Sebekdots-sway"
REPO_URL_HYPRLAND="https://github.com/andrewsebek/Sebekdots"

# Directorios temporales para clonar
TEMP_DIR=$(mktemp -d)

# Función para clonar y revisar actualizaciones
check_updates() {
  REPO_URL=$1
  LAST_COMMIT_FILE=$2
  MODULE_ICON=$3

  # Clonar el repositorio
  git clone "$REPO_URL" "$TEMP_DIR"

  # Revisar el último commit
  LAST_COMMIT=$(git -C "$TEMP_DIR" log -1 --format="%ct")

  # Comparar con el último commit guardado localmente
  if [ "$LAST_COMMIT" -ne "$(cat $LAST_COMMIT_FILE 2>/dev/null || echo 0)" ]; then
    echo "Se encontró una actualización en el repositorio"
    echo "$LAST_COMMIT" > "$LAST_COMMIT_FILE"
    echo "{\"text\": \"$MODULE_ICON\", \"class\": \"update\"}"  # Cambiar icono
  else
    echo "{\"text\": \"$MODULE_ICON\", \"class\": \"\"}"  # Sin cambios
  fi
}

# Detectar si el usuario está usando Sway o Hyprland
if pgrep -x "sway" > /dev/null; then
  # Usuario está usando Sway
  check_updates "$REPO_URL_SWAY" "$HOME/.last_commit_sway" "󰂖"
elif pgrep -x "Hyprland" > /dev/null; then
  # Usuario está usando Hyprland
  check_updates "$REPO_URL_HYPRLAND" "$HOME/.last_commit_hyprland" "󰂕"
else
  echo "No se detectó ni Sway ni Hyprland."
fi

# Limpiar el directorio temporal
rm -rf "$TEMP_DIR"

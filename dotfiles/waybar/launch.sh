#!/bin/bash

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar
killall swaync
sleep 0.2

# ----------------------------------------------------- 
# Get current theme information from .cache/.themestyle.sh
# ----------------------------------------------------- 
if [ -f ~/.cache/.themestyle.sh ]; then
    themestyle=$(cat ~/.cache/.themestyle.sh)
else
    touch ~/.cache/.themestyle.sh
    echo "$themestyle" > ~/.cache/.themestyle.sh
fi

IFS=';' read -ra arrThemes <<< "$themestyle"
echo ${arrThemes[0]}

if [ ! -f ~/dotfiles/waybar/themes${arrThemes[1]}/style.css ]; then
    themestyle="/classic;/classic"
fi

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config"
style_file="style.css"

# Check used files
echo "Config: $config_file"
echo "Style: $style_file"

waybar -c ~/dotfiles/waybar/themes${arrThemes[0]}/$config_file -s ~/dotfiles/waybar/themes${arrThemes[1]}/$style_file &

themestyle=$(cat ~/.cache/.themestyle.sh)

if [[ $themestyle == *arriba* ]]; then
    killall swaync 
    swaync -c ~/dotfiles/arriba/config.json -s ~/dotfiles/arriba/style.css &
fi
if [[ $themestyle == *abajo* ]]; then
    killall swaync
    swaync -c ~/dotfiles/abajo/config.json -s ~/dotfiles/abajo/style.css &
fi

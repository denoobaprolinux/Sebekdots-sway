#!/bin/bash
# Kill and restart waybar whenever its config files change

killall waybar &
   
if [ -f ~/.cache/.themestyle.sh ]; then
    themestyle=$(cat ~/.cache/.themestyle.sh)
else
    touch ~/.cache/.themestyle.sh
    echo "$themestyle" > ~/.cache/.themestyle.sh
fi

IFS=';' read -ra arrThemes <<< "$themestyle"
echo ${arrThemes[0]}

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config"
style_file="style.css"

# Standard files can be overwritten with an existing config-custom or style-custom.css
if [ -f ~/dotfiles/waybar/themes${arrThemes[0]}/config-custom ] ;then
    config_file="config-custom"
fi
if [ -f ~/dotfiles/waybar/themes${arrThemes[1]}/style-custom.css ] ;then
    style_file="style-custom.css"
fi

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
if [[ $themestyle == *izquierda* ]]; then
    killall swaync
    swaync -c ~/dotfiles/izquierda/config.json -s ~/dotfiles/izquierda/style.css &
fi
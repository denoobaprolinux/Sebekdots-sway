#!/bin/bash

nwg-menu -va top -ml 10 -cmd-lock "swaylock -i /$HOME/.cache/current_wallpaper.jpg" -cmd-logout "swaymsg exit" -cmd-restart "reboot" -cmd-shutdown "poweroff" -fm "nautilus" -d -isl 20 -iss 10

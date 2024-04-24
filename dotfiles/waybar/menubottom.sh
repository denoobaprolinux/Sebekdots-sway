#!/bin/bash

nwg-menu -va bottom -ml 10 -cmd-lock "/$HOME/dotfiles/waybar/lock.sh" -cmd-logout "swaymsg exit" -cmd-restart "reboot" -cmd-shutdown "poweroff" -fm "nautilus" -d -isl 20 -iss 10

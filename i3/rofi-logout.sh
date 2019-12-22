#!/bin/bash

# Remember to give it exec priviledge, or chmod +x /path/to/power.sh

chosen=$(echo -e "Logout\nShutdown\nReboot" | rofi -dmenu -i)

if [[ $chosen = "Logout" ]]; then
	jwm -exit
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
fi

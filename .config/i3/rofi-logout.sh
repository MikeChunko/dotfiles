#!/bin/bash

# Remember to give it exec priviledge, or chmod +x /path/to/power.sh

chosen=$(echo -e "Logout\nSuspend\nShutdown\nReboot" | rofi -dmenu -i)

if [[ $chosen = "Logout" ]]; then
	i3-msg exit
elif [[ $chosen = "Suspend" ]]; then
	systemctl suspend && i3lockr --blur 200 -- --nofork --ignore-empty-password
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
fi

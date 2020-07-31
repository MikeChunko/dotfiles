#!/bin/sh

# Remember to give it exec priviledge, or chmod +x /path/to/rofi-logout.sh

chosen=$(echo -e "Shutdown\nReboot\nSuspend\nLogout" | rofi -dmenu -i)

if [ $chosen = "Logout" ]; then
	i3-msg exit
elif [ $chosen = "Suspend" ]; then
	systemctl suspend && i3lockr --blur 200 -- --nofork --ignore-empty-password
elif [ $chosen = "Shutdown" ]; then
	systemctl poweroff
elif [ $chosen = "Reboot" ]; then
	systemctl reboot
fi

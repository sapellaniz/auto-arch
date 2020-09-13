#! /bin/bash

LOG_OUT="\tLog Out"
POWER_OFF="\tPower Off"
REBOOT="\tReboot"
SUSPEND="\tSuspend"
HIBERNATE="\tHibernate"
LOCK="\tLock Screen"

options="$POWER_OFF\n$REBOOT\n$LOG_OUT\n$LOCK\n$SUSPEND\n$HIBERNATE"

#option=$(echo -e $options | rofi -dmenu -p " ")
option=$(echo -e $options | rofi -dmenu -p " " -font "NotoColorEmoji 10")

echo $option
case $option in
    *"Power Off")
        /usr/sbin/poweroff
        ;;
    *"Reboot")
        systemctl reboot
        ;;
    *"Log Out")
        bspc quit
        ;;
    *"Suspend")
        systemctl suspend
        ;;
    *"Hibernate")
        systemctl hibernate
        ;;
    *"Lock Screen")
#        betterlockscreen -l dim
	 i3lock-fancy
	;;
    *)
        ;;
esac

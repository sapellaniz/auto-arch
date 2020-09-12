# This script noseke nosekuan
# Author yop

# Check UID & $HOME
[ $(id -u) -ne 0 ] && echo "error: you cannot perform this operation unless you are root."
[ "$HOME" == "/root" ] && echo "warning: you are installing the environment for root user, please run sudo -E bash autoArch.sh or comment line 2"

# Install
pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd terminator rofi git firefox man
git clone "$MYREPO!!!!!!" 
mv dotfiles/.* ~/       // .bashrc .xinitrc .config/sxhkd/sxhkdrc .config/sxhkd/sxhkdrc

/etc/bash.bashrc

# sudo pacman -S virtualbox-guest-utils && sudo systemctl enable vboxservice && reboot
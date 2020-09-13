# This script noseke nosekuan
# Author yop

# Check UID
[ "$(id -u)" -eq 0 ] && echo "warning: you are installing the environment for root user, if you really want it just comment line X." && exit

# Install
sudo pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd terminator mlocate rofi firefox zsh man
yay -S --noconfirm zsh-syntax-highlighting-git polybar // NO CONFIRM?
usermod -s $(which zsh) $(whoami)
m
su cp dotfiles/.* ~/       // .zshrc .xinitrc .config/bspwm/bspwmrc .config/sxhkd/sxhkdrc 


rm ~/.bash*
# sudo pacman -S virtualbox-guest-utils && sudo systemctl enable vboxservice && reboot
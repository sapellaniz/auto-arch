# This script noseke nosekuan
# Author yop

# Check UID & yay
[ "$(id -u)" -eq 0 ] && echo "error: avoid running autoArch.sh as root/sudo." && exit
if ! $(which yay &>/dev/null) ; then
    echo "error: yay not found." && exit
fi

# Install
sudo pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd terminator mlocate rofi firefox zsh man alsa-utils pulseaudio
yay -S --noconfirm zsh-syntax-highlighting-git polybar-git picom-ibhagwan-git ttf-nerd-fonts-hack-complete-git // NO CONFIRM?
usermod -s $(which zsh) $(whoami)

su cp dotfiles/.* ~/       // .zshrc .xinitrc 
                            .config/bspwm/bspwmrc  
                            .config/sxhkd/sxhkdrc
                            .config/picom/picom.conf
                            .config/polybar/config
                            .config/polybar/launch.sh

rm ~/.bash*
# sudo pacman -S virtualbox-guest-utils && sudo systemctl enable vboxservice && reboot
# This script noseke nosekuan
# Author yop

# Check UID & yay
[ "$(id -u)" -eq 0 ] && echo "error: avoid running autoArch.sh as root/sudo." && exit
if ! $(which yay &>/dev/null) ; then
    echo "error: yay not found." && exit
fi

# Select best mirrors before start downloading
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

# Install
sudo pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd xwallpaper terminator zsh man mlocate rofi firefox scrot alsa-utils pulseaudio
yay -S --noconfirm zsh-syntax-highlighting-git polybar-git picom-ibhagwan-git ttf-nerd-fonts-hack-complete-git
sudo usermod -s $(which zsh) $(whoami)

cp -r dotfiles/.* ~/       
chmod u+x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/rofi-power.sh
#.zshrc
#.xinitrc
#.config/wall.png
#.config/bspwm/bspwmrc  
#.config/sxhkd/sxhkdrc
#.config/picom/picom.conf
#.config/polybar/config
#.config/polybar/launch.sh
#.config/bin/ethernet_status.sh
#.config/bin/rofi-power.sh

# Remove unnecessary dotfiles
rm ~/.bash*

# Remove orphans
sudo pacman -Rs $(pacman -Qqtd) --noconfirm 
# sudo pacman -S virtualbox-guest-utils && sudo systemctl enable vboxservice && reboot
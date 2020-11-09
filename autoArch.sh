# Script for build a cool graphical user interface for Arch Linux
# Author Sergio Apellaniz

# Check UID & yay
[ "$(id -u)" -eq 0 ] && echo "error: avoid running autoArch.sh as root/sudo." && exit
if ! $(which yay &>/dev/null) ; then
    echo "error: yay not found." && exit
fi

# Select best mirrors before start downloading
sudo pacman -S reflector
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

# DWM & DMENU & X-Server & xwallpaper
mkdir ~/.config
sudo pacman -S --noconfirm base-devel binutils fakeroot make automake autoconf xorg /xorg-server /xf86-video-fbdev xorg-xinit xwallpaper
yay -S --noconfirm ttf-nerd-fonts-hack-complete-git

pushd ~/.config
git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/dmenu
git clone git://git.suckless.org/st
popd
mv -f dotfiles/config.h ~/.config/dwm
pushd ~/.config/dwm
make clean install
cd ../dmenu
make clean install
cd ../st
make clean install

echo -e "setxkbmap es\nxwallpaper --focus ~/.config/wall.png\nexec dwm" > ~/.xinitrc


# zsh & tmux
mkdir ~/.config/zsh ~/.config/tmux ~/.config/vim
popd
mv dotfiles/.z* ~/.config/zsh
mv dotfiles/tmux.conf ~/.config/tmux
mv dotfiles/wall.png ~/.config

sudo pacman -S --noconfirm zsh tmux zsh-syntax-highlighting

sudo usermod -s $(which zsh) $(whoami)

echo "es_ES.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LC_ALL=es_ES.UTF-8" | sudo tee -a /etc/environment
echo "LANG=es_ES.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen es_ES.UTF-8

echo "$(which tmux) -f ~/.configm/tmux/tmux.conf" | sudo tee -a /usr/local/bin/tmux
echo "$(which vim) -u ~/.config/vim/vimrc" | sudo tee -a /usr/local/bin/vim
ln -s ~/.config/zsh/.zshenv ~/.zshenv

# Remove orphans
sudo pacman -Rs $(pacman -Qqtd) --noconfirm
 
# Auto clean
cd ..
rm -fr auto-arch

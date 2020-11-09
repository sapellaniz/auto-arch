# Boot raspberry pi from USB & install arch on USB
	https://www.tomshardware.com/how-to/boot-raspberry-pi-4-usb

	# Prepare usb
	#	Before unmounting the partitions
	#	(sed -i 's/mmcblk0p1/sda1/g' root/etc/fstab)
	#	(sed -i 's/mmcblk0p2/sda2/g' boot/cmdline.txt)
	https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4

# Basic config
	# Disable anoying audit messages
	(append audit=0 to /boot/cmdline.txt)

	pacman -Syu
	pacman -S sudo vim git

	echo KEYMAP=es > /etc/vconsole.conf
	userdel -r alarm
	passwd
	useradd x -m -G wheel,storage,power
	passwd x
	# uncomment %wheel ALL=(ALL) ALL
	ln -s /usr/bin/vim /usr/bin/vi
	visudo
	su x
	
	# yay
	cd /opt
	sudo git clone https://aur.archlinux.org/yay-git.git
	sudo chown -R x:x yay-git
	cd yay-git
	makepkg -si
	# guess aditions
	# sudo pacman -S virtualbox-guest-utils	
	# config -> pantall -> controlador grafico -> VBoxVGA
	
###
# Auto-arch.sh
#####

# Script for build a cool graphical user interface for Arch Linux
# Author Sergio Apellaniz

# Check UID & yay
[ "$(id -u)" -eq 0 ] && echo "error: avoid running autoArch.sh as root/sudo." && exit
if ! $(which yay &>/dev/null) ; then
    echo "error: yay not found." && exit
fi

# DWM & DMENU & X-Server & xwallpaper
	sudo pacman -S --noconfirm base-devel binutils fakeroot make automake autoconf xorg /xorg-server /xf86-video-fbdev xorg-xinit xwallpaper
	yay -S --noconfirm ttf-nerd-fonts-hack-complete-git

	cd /usr/src
	sudo git clone git://git.suckless.org/dwm
	sudo git clone git://git.suckless.org/dmenu
	sudo git clone git://git.suckless.org/st
	cd dwm
	sudo make clean install
	cd ../dmenu
	sudo make clean install
	cd ../st
	sudo make clean install

	echo -e "setxkbmap es\nxwallpaper --focus ~/.config/wall.png\nexec dwm" > ~/.xinitrc


# zsh & tmux
	mkdir -p ~/.config/zsh ~/.config/tmux ~/.config/vim

	sudo pacman -S --noconfirm zsh tmux zsh-syntax-highlighting

	sudo usermod -s $(which zsh) $(whoami)

	echo "es_ES.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
	echo "LC_ALL=es_ES.UTF-8" | sudo tee -a /etc/environment
	echo "LANG=es_ES.UTF-8" | sudo tee -a /etc/locale.conf
	sudo locale-gen es_ES.UTF-8

	echo "$(which tmux) -f ~/.configm/tmux/tmux.conf" | sudo tee -a /usr/local/bin/tmux
	echo "$(which vim) -u ~/.config/vim/vimrc" | sudo tee -a /usr/local/bin/vim
	ln -s ~/.config/zsh/.zshenv ~/.zshenv

# Silent boot
	# systemd
		echo "quiet" >> /boot/cmdline.txt

	# agetty
	systemctl edit getty@tty1.service
        	[Service]
	        ExecStart=
	        ExecStart=-/usr/bin/agetty --skip-login --nonewline --noissue --autologin username --noclear %I $TERM

	# motd
	sudo rm /etc/motd


# Remove orphans
sudo pacman -Rs $(pacman -Qqtd) --noconfirm
 
# Auto clean
rm -fr ../.git
rm -fr $PWD

# DOTFILES
	/usr/src/
		dwm
		dmenu
		st
	~/.config/zsh/.zshenv
	~/.config/zsh/.zshrc
	~/.config/zsh/.zprofile
	~/.config/tmux/tmux.conf
	~/.config/vim/vimrc
	~/.config/wall.png

https://feldspaten.org/2020/07/05/raspberry-pi-4-and-kvm/

# Auto Arch

Script para automatizar la personalización del entorno de Arch Linux. Entorno DWM! Probado en máquinas x86 y ARM.

![img](dwm.png)

- **Requisitos:**
    - [yay](https://aur.archlinux.org/packages/yay/)

- **Instalación:**
```
git clone -b dwm https://github.com/sapellaniz/auto-arch.git
cd auto-arch
bash autoArch.sh [ARM]
```
- **Incluye:**
    - dwm
    - dmenu
    - st
    - zsh
    - tmux
    - Configura los mejores mirrors y elimina paquetes huérfanos.

- **Atajos:**

- **Dotfiles:**

- **Silent boot:**

Salta el grub, esconde la salida de systemd, un usuario específio se auto loguea en la tty1 y se redirige la stdout de startx a /dev/null.
```
# grub (solo x86)
/etc/default/grub
        GRUB_TIMEOUT=0
        GRUB_TIMEOUT_STYLE='hidden'
grub-mkconfig -o /boot/grub/grub.cfg

# systemd (solo ARM)
# Añadir "quiet" al final de la línea de "/boot/cmdline.txt"

# agetty
systemctl edit getty@tty1.service
        [Service]
        ExecStart=
        ExecStart=-/usr/bin/agetty --skip-login --nonewline --noissue --autologin username --noclear %I $TERM

# startx
vim .zprofile
    [ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx &> /dev/null
```


# Auto Arch

Script para automatizar la personalización del entorno de Arch Linux.

![img](screen.png)

- **Requisitos:**
    - [yay](https://aur.archlinux.org/packages/yay/)
- **Instalación:**
```
git clone https://gitlab.com/sapellaniz/auto-arch.git
cd auto-arch
bash autoArch.sh
```
- **Incluye:**
    - sxhkd
    - bspwm
    - polybar
    - picom
    - zsh
    - Configura los mejores mirrors y elimina paquetes huérfanos.

**Silent boot:**

Salta el grub, un usuario específio se auto loguea en la tty1 y se redirige la stdout de startx a /dev/null.
```
# grub
/etc/default/grub
        GRUB_TIMEOUT=0
        GRUB_TIMEOUT_STYLE='hidden'
grub-mkconfig -o /boot/grub/grub.cfg

# agetty
systemctl edit getty@tty1.service
        [Service]
        ExecStart=
        ExecStart=-/usr/bin/agetty --skip-login --nonewline --noissue --autologin username --noclear %I $TERM

# startx
.zprofile
    [ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx &> /dev/null
```
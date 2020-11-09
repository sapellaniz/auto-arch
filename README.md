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
    - ~/.config/
    - ~/.config/
    - ~/.config/
    - ~/.config/
    - ~/.config/
    - ~/.config/
    - ~/.config/
    - ~/.config/wall.png

- **Silent boot:**

Salta el grub, esconde la salida de systemd, un usuario específio se auto loguea en la tty1, se redirige la stdout de startx a /dev/null y se elimina el banner.
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

# banner
rm /etc/motd
```

- **Raspberry tips:**

Instalar el sistema en un USB 3.0 en vez de en una memoria micro SD, aumenta notablemente el rendimiento.

1. Arrancar la rasp desde USB:

    - Seguir el siguiente tutorial hasta el paso 13 (no clonar SD)
    - https://www.tomshardware.com/how-to/boot-raspberry-pi-4-usb

2. Instalar Arch ARM para raspberry en un USB:

    - Seguir la guía oficial:
    - https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4
    - Antes de desmontar las particiones ejecutar los siguientes comandos:

```
# Cambiar sda por el disco correspondiente
(sed -i 's/mmcblk0p1/sda1/g' root/etc/fstab)
(sed -i 's/mmcblk0p2/sda2/g' boot/cmdline.txt)
```

3. Deshabilitar molestos mensajes del sistema:

    - Añadir "audit=0" a la línea de "/boot/cmdline.txt"

#!/bin/sh

# CREATE A TMP-WORKING-DIR AN NAVIGATE TO IT
mkdir -p /tmp/pacaur_install
cd /tmp/pacaur_install

# INSTALL DEPENDENCY "expac" AND "yajl" FROM EXTRA
sudo pacman -S expac yajl --noconfirm

# INSTALL DEPENDENCY "cower" FROM AUR
curl -o PKGBUILD https://aur.archlinux.org/packages/co/cower/PKGBUILD
chown $user .
su -c "makepkg" - $user
sudo pacman -U cower*.tar.xz --noconfirm

# INSTALL "pacaur" FROM AUR
curl -o PKGBUILD https://aur.archlinux.org/packages/pa/pacaur/PKGBUILD
chown $user .
su -c "makepkg" - $user
sudo pacman -U pacaur*.tar.xz --noconfirm

# CLEAN THE TMP-WORKING-DIR
cd ~
rm -r /tmp/pacaur_install

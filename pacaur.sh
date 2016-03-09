#!/bin/sh

# CREATE A TMP-WORKING-DIR AN NAVIGATE TO IT
mkdir -p /tmp/pacaur_install
cd /tmp/pacaur_install

# INSTALL DEPENDENCY "expac", "yajl" AND "git" FROM EXTRA
sudo pacman -S expac yajl git --noconfirm

# INSTALL DEPENDENCY "cower" FROM AUR
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg PKGBUILD --skippgpcheck
sudo pacman -U cower*.tar.xz --noconfirm

# INSTALL "pacaur" FROM AUR
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg PKGBUILD
sudo pacman -U pacaur*.tar.xz --noconfirm

# CLEAN THE TMP-WORKING-DIR
rm -r /tmp/pacaur_install


#build yaourt and install:
sudo pacman -S wget curl yajl diffutils gettext --noconfirm;
cd /home/$user
mkdir tmp
cd tmp;
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz;
wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz;
tar -xvf yaourt.tar.gz;
tar -xvf package-query.tar.gz;
rm yaourt.tar.gz;
rm package-query.tar.gz;
cd package-query;
su #user -c "makepkg";
sudo pacman -U package-query-*.pkg.tar.xz --noconfirm;
cd ..;
rm -rf package-query;
cd yaourt;
su #user -c "makepkg";
sudo pacman -U yaourt-*.pkg.tar.xz --noconfirm;
cd ..;
rm -rf yaourt;

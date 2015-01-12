
echo root pass:
passwd

echo hostname:
read hostname
echo $hostname > /etc/hostname

echo user:
read user
useradd $user
echo password:
passwd $user
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

echo en_US.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
locale > /etc/locale.conf

pacman -S sudo base-devel --noconfirm
echo "$user ALL=(ALL) ALL" >> /etc/sudoers

mkdir -p /home/$user
chown -R $user /home/$user

pacman -Syyu --noconfirm

./yaourt.sh

su $user <<ASDF
./dotfiles.sh
yaourt -S $(cat packages_min.txt) --noconfirm
ASDF

echo git email:
read gitmail
git config --global user.email "$gitmail"

echo git user.name:
read gitname
git config --global user.name "$gitname"

#enable services here:


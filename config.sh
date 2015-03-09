
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
echo setting central time..
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

echo en_US.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
locale > /etc/locale.conf

pacman -S sudo base-devel stow --noconfirm
echo "$user ALL=(ALL) ALL" >> /etc/sudoers

mkdir -p /home/$user
chown -R $user /home/$user

pacman -Syyu --noconfirm

export user=$user
./yaourt.sh

chown $user dotfiles.sh
su $user -c "./dotfiles.sh"
chown $user install.sh packages_min.txt
su $user -c "./install.sh packages_min.txt"


#enable services here:


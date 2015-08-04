
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

pacman -S sudo base-devel stow dialog wpa_supplicant --noconfirm
echo "$user ALL=(ALL) ALL" >> /etc/sudoers

mkdir -p /home/$user
chown -R $user /home/$user

export user=$user
./yaourt.sh

chown $user dotfiles.sh
su $user -c "./dotfiles.sh"

# Install needed programs on first boot instead of while chroot'd
chown $user install.sh packages_min.txt
cp install.sh /home/$user/install.sh
cp packages_min.txt /home/$user/packages_min.txt
chown -R $user /home/$user #own the above
cat bash_remind.txt /home/$user/.bashrc > /home/$user/.bashrc_tmp
mv /home/$user/.bashrc_tmp /home/$user/.bashrc

# enable services here:


echo "You will be prompted to install packages on boot."
pacman -S gptfdisk syslinux --noconfirm
syslinux-install_update -i -a -m

# Beast man would hate this
root_uuid="$(lsblk --output "mountpoint,uuid" | grep  "/ " | grep -oE "[^ ]+" | tail -n 1)"
sed -i "s/\/dev\/sda3/UUID=$root_uuid/g" /boot/syslinux/syslinux.cfg

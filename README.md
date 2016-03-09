## AutoArch

Queries for and sets up:

- Initial user with sudo
- Time => America/Chicago
- locale en_US.UTF8
- pacaur install
- initial clone of [my dotfiles](https://github.com/neeasade/dotfiles)
- adds a reminder to bashrc to install packages from file
- install syslinux configured for UUID of the drive chroot'd

### Usage

Upon initial chroot from the live iso:
```
curl http://blog.neeasade.net/data/install.sh > install.sh && bash install.sh
```

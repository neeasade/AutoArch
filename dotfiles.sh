#!/bin/sh

git clone http://github.com/neeasade/dotfiles ~/.dotfiles && cd ~/.dotfiles/meta
./deploy.sh noinstall

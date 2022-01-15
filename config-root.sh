#!/usr/bin/env bash

# Install Base Packages
apt install sudo build-essential git node npm lightdm awesome awesome-extra network-manager w3m vim neovim neofetch compton rxvt-unicode zsh zplug python python3 python3-pip xsel chromium xsettingsd exa libxext-dev libxres-dev

# Set up LightDM
dpkg-reconfigure lightdm

# Set up ZSH
chsh -s $(which zsh)

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
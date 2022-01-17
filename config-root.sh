#!/usr/bin/env bash

# Install Base Packages
apt install sudo build-essential dkms linux-headers-$(uname -r) git nodejs npm lightdm awesome awesome-extra network-manager compton zsh terminator kitty rxvt-unicode links luakit firefox-esr neovim neofetch exa python3 python3-pip unclutter xsel xsettingsd libxext-dev libxres-dev lxappearance mesa-utils software-properties-common

# Set up LightDM
dpkg-reconfigure lightdm

# Set up ZSH
chsh -s $(which zsh)

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
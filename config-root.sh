#!/usr/bin/env bash

# Install Base Packages
apt install sudo build-essential git nodejs npm lightdm awesome awesome-extra network-manager compton zsh kitty links luakit neovim neofetch exa python3 python3-pip unclutter xsel xsettingsd libxext-dev libxres-dev lxappearance

# Set up LightDM
dpkg-reconfigure lightdm

# Set up ZSH
chsh -s $(which zsh)

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
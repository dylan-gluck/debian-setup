#!/usr/bin/env bash

# Copy Backgrounds
sudo mkdir /usr/share/backgrounds
cp backgrounds/* /usr/share/backgrounds

# Awesome Config
mkdir ~/.config/awesome
cp /etc/xdg/awesome/rc.lua ~/.config/awesome

# Download Awesome Themes
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats

# Install OhMyZSH
echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; source ~/.zshrc

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Sublime3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -; echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list; sudo apt update; sudo apt install sublime-text;

# Install Codium
sudo apt install packages/codium_1.35.1-1560422388_i386.deb

# Install Ueberzug
sudo pip3 install ueberzug ranger-fm
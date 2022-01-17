#!/usr/bin/env bash

# User Setup
# This file removes any current config from local machine
# Creates sym-links that point to files in this repo
# Settup base config for new machine instantly

# Copy Backgrounds
sudo rm -rf /usr/share/backgrounds
sudo ln -s $PWD/backgrounds/* /usr/share/backgrounds

# Copy awesome-login.sh
rm -f ~/awesome-login.sh
ln -s $PWD/awesome-login.sh ~/awesome-login.sh
chmod +x ~/awesome-login.sh

# Awesome Config
rm -rf ~/.config/awesome
ln -s $PWD/config/awesome ~/.config/awesome

# LightDM Config
sudo rm -f /etc/lightdm/lightdm.conf
sudo rm -f /etc/lightdm/lightdm-gtk-greeter.conf
sudo ln -s $PWD/config/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -s $PWD/config/lightdm-gtk-greeter.conff /etc/lightdm/lightdm-gtk-greeter.conf

# Xresources
rm -f ~/.Xresources
ls -s $PWD/config/.Xresources ~/.Xresources
xrdb ~/.Xresources

# Kitty Config
rm -f ~/.config/kitty/kitty.conf 
ls -s $PWD/config/kitty.conf ~/.config/kitty/kitty.conf

# Copy Fonts
rm -rf ~/.fonts
ls -s $PWD/fonts/* ~/.fonts/
xset +fp ~/.fonts
xset +fp ~/.fonts/misc

# Copy Theme Files
rm -rf ~/.themes
ls -s $PWD/themes ~/.themes

# Copy Icons
rm -rf ~/.local/share/icons 
ls -s $PWD/icons ~/.local/share/icons

# GTK Theme
rm -f ~/.config/gtk-3.0/settings.ini
ln -s $PWD/config/settings.ini ~/.config/gtk-3.0/settings.ini

# Install OhMyZSH
echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH Config
rm -f ~/.zshrc
ls -s $PWD/config/.zshrc ~/.zshrc
source ~/.zshrc

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Uncomment to Install Sublime3
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -; echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list; sudo apt update; sudo apt install sublime-text;

# Uncomment to Install Codium
# sudo apt install packages/codium_1.35.1-1560422388_i386.deb

# Install Ueberzug & Ranger
sudo pip3 install ueberzug ranger-fm

# Install NPM Packages
npm install -g yarn gtop
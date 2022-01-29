#!/usr/bin/env bash

# User Setup
# This file removes any current config from local machine
# Creates sym-links that point to files in this repo
# Settup base config for new machine instantly

# Copy Backgrounds
sudo rm -rf /usr/share/backgrounds
sudo ln -s $PWD/backgrounds /usr/share/backgrounds

# Copy awesome-login.sh
rm -f ~/aweslome-login.sh
ln -s $PWD/awesome-login.sh ~/awesome-login.sh
chmod +x ~/awesome-login.sh

# Make config folder
mkdir ~/.config

# Awesome Config
rm -rf ~/.config/awesome
ln -s $PWD/config/awesome ~/.config/awesome

# LightDM Config
sudo rm -f /etc/lightdm/lightdm.conf
sudo rm -f /etc/lightdm/lightdm-gtk-greeter.conf
sudo ln -s $PWD/config/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -s $PWD/config/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf;

# Xresources
rm -f ~/.Xresources
ln -s $PWD/config/.Xresources ~/.Xresources
xrdb ~/.Xresources

# Kitty Config
mkdir ~/.config/kitty
rm -f ~/.config/kitty/kitty.conf 
ln -s $PWD/config/kitty.conf ~/.config/kitty/kitty.conf

# Ranger Config
mkdir ~/.config/ranger
rm -f ~/.config/ranger/rc.conf
ln -s $PWD/config/ranger/rc.conf ~/.config/ranger/rc.conf

# Copy Fonts
rm -rf ~/.fonts
ln -s $PWD/fonts ~/.fonts
xset +fp ~/.fonts/misc

# Copy Theme Files
rm -rf ~/.themes
ln -s $PWD/themes ~/.themes

# Copy Icons
rm -rf ~/.local/share/icons 
ln -s $PWD/icons ~/.local/share/icons

# GTK Theme
mkdir ~/.config/gtk-3.0
rm -f ~/.config/gtk-3.0/settings.ini
ln -s $PWD/config/settings.ini ~/.config/gtk-3.0/settings.ini

# Install OhMyZSH
echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ZSH Config
rm -f ~/.zshrc
ln -s $PWD/config/.zshrc ~/.zshrc
source ~/.zshrc

# Uncomment to Install Sublime3
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -; echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list; sudo apt update; sudo apt install sublime-text;

# Uncomment to Install Codium
# sudo apt install packages/codium_1.35.1-1560422388_i386.deb

# Install Ueberzug & Ranger
sudo pip3 install ueberzug ranger-fm

# Install NPM Packages
sudo npm install -g yarn gtop

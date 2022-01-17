# Quickstart

```
# Install base Debian

# Download & Run config-root.sh
sh -c "$(curl -fsSL https://raw.github.com/dylan-gluck/linux-config/main/config-root.sh)"

# Add main user to sudo group
usermod -aG sudo [user]

# Login as non-root user
su [user]

# Download git repo, run install script
cd ~
git clone https://github.com/dylan-gluck/linux-config
cd linux-config
chmod +x ./config-user.sh && ./config-user.sh
```

- Add powerlevel10k theme to `.zshrc`
- Add aliases to `.zshrc`
- Edit Aesome config `~/.config/awesome/rc.lua`
  - Use default config from theme, customize from there
  - Login script with launchers
  - Add keybindings etc
- Edit Theme config
  - Customize background
  - Add widgets etc
- Edit LightDM Config `/etc/lightdm/lightdm.conf`
- Edit LightDM Background `/etc/lightdm/lightdm-gtk-greeter.conf`
- Configure GTK Theme `~/.config/gtk-3.0/settings.ini`
- Customize Kitty `~/. config/kitty/kitty. conf`

...

# Root Configuration

## Base Packages

Install these base packages as root on first login

```
apt install sudo build-essential dkms linux-headers-$(uname -r) git nodejs npm lightdm awesome awesome-extra network-manager compton zsh terminator kitty rxvt-unicode links luakit firefox-esr neovim neofetch exa python3 python3-pip unclutter xsel xsettingsd libxext-dev libxres-dev lxappearance mesa-utils software-properties-common
```

## TODO:

Remember to Remove:

```
chromium w3m zplug python
```

## Setup LightDM

LightDM configuration file is found at `/etc/lightdm/lightdm.conf`. Making a backup of the original configuration file is recommended. Alternatively, create `/etc/lightdm/lightdm.conf.d/` and place your configuration files there.

```
dpkg-reconfigure lightdm
```

## Setup ZSH

```
chsh -s $(which zsh); sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# User Configuration

Login as non-root user.

## VSCodium Reference

```
# Deb Package
https://github.com/VSCodium/vscodium/releases/download/1.35.1/codium_1.35.1-1560422388_i386.deb

# 32 Bit Source
https://github.com/VSCodium/vscodium/releases/download/1.35.1/VSCodium-linux-ia32-1.35.1.tar.gz
```

## Sublime Text Reference

```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
sudo apt update;
sudo apt install sublime-text;
```

---

## Install oh my szh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## powerlevel10k theme

```
# Clone Repo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

---

## Generate SSH Keys

```
ssh-keygen
```

---

## Backgrounds

```
sudo mkdir /usr/share/backgrounds
```

Debian's LightDM GTK greeter is configured in /etc/lightdm/lightdm-gtk-greeter.conf.

```
[greeter]
background=/path/to/file.svg
```

## GTK Theme Settings

`~/.config/gtk-3.0/settings.ini`

```
[Settings]
gtk-application-prefer-dark-theme = false
gtk-theme-name = Zukitwo
gtk-fallback-icon-theme = gnome
gtk-icon-theme-name = Faenza-Dark
gtk-font-name = Terminus 12
```

---

## Autorun Commands

```
# ~/awesome-login.sh
xsettingsd &;
xset +fp ~/.fonts/misc/;
compton -b;
```

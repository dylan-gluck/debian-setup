# Quickstart

```
# Install base Debian

# Download & Run config-root.sh
sh -c "$(curl -fsSL https://raw.github.com/dylan-gluck/linux-config/main/config-root.sh)"

# Add main user to sudo group
usermod -aG sudo [user]

# Login as non-root user

# Download git repo, run install script
cd ~; git clone https://github.com/dylan-gluck/linux-config; cd linux-config; chmod +x ./config-user.sh; ./config-user.sh
```

- Add powerlevel10k theme to `.zshrc`
- Add aliases to `.zshrc`
- Edit Aesome config `~/.config/awesome/rc.lua`
- Edit Theme config
- Edit LightDM Config `/etc/lightdm/lightdm.conf`
- Edit LightDM Background `/etc/lightdm/lightdm-gtk-greeter.conf`

...

# Root Configuration

## Base Packages

Install these base packages as root on first login

```
apt install sudo build-essential git lightdm awesome awesome-extra network-manager w3m vim neovim neofetch compton rxvt-unicode zsh zplug python python3 python3-pip xsel chromium xsettingsd exa libxext-dev libxres-dev
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

## Install VSCodium

```
# Deb Package
https://github.com/VSCodium/vscodium/releases/download/1.35.1/codium_1.35.1-1560422388_i386.deb

# 32 Bit Source
https://github.com/VSCodium/vscodium/releases/download/1.35.1/VSCodium-linux-ia32-1.35.1.tar.gz
```

## Install Sublime Text

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

---

## Autorun Commands

```
# ~/awesome-login.sh
xsettingsd &;
xset +fp ~/.fonts/misc/;
compton -b;
```

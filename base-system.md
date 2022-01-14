# Linux Config Notes

Single source of notes for new linux install

## Base Packages

Install these base packages as root on first login

```
apt install sudo build-essential git lightdm awesome awesome-extra network-manager w3m vim neovim neofetch compton rxvt-unicode zsh zplug python python3 python3-pip xsel chromium
```

## Setup LightDM

LightDM configuration file is found at `/etc/lightdm/lightdm.conf`. Making a backup of the original configuration file is recommended. Alternatively, create `/etc/lightdm/lightdm.conf.d/` and place your configuration files there.

```
dpkg-reconfigure lightdm
```

Debian's LightDM GTK greeter is configured in /etc/lightdm/lightdm-gtk-greeter.conf.

```
[greeter]
background=/path/to/file.svg
```

## Setup ZSH

Create ~/.zshrc

```
# Set path if required
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration

# Set up the prompt - if you load Theme with zplugin as in this example, this will be overriden by the Theme. If you comment out the Theme in zplugins, this will be loaded.
autoload -Uz promptinit
promptinit
prompt adam1            # see Zsh Prompt Theme below

# Use vi keybindings even if our EDITOR is set to vi
bindkey -e

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose
```

Make ZSH Default Shell

```
chsh -s /bin/zsh
```

---

## Reboot!

#### Login as non-root user.

...

## Setup urxvt

Clone urxvt-perls. Enter the urxvt-perls folder, then copy keyboard-select, clipboard, and url-select to `~/.urxvt/ext`

```
git clone https://github.com/muennich/urxvt-perls
```

Now create a file called ~/.Xresources

```
!! Colorscheme

! special
*.foreground: #93a1a1
*.background: #141c21
*.cursorColor: #afbfbf

! black
*.color0: #263640
*.color8: #4a697d

! red
*.color1: #d12f2c
*.color9: #fa3935

! green
*.color2: #819400
*.color10: #a4bd00

! yellow
*.color3: #b08500
*.color11: #d9a400

! blue
*.color4: #2587cc
*.color12: #2ca2f5

! magenta
*.color5: #696ebf
*.color13: #8086e8

! cyan
*.color6: #289c93
*.color14: #33c5ba

! white
*.color7: #bfbaac
*.color15: #fdf6e3

!! URxvt Appearance
URxvt.font: xft:Iosevka:style=Regular:size=8
URxvt.boldFont: xft:Iosevka:style=Bold:size=8
URxvt.italicFont: xft:Iosevka:style=Italic:size=8
URxvt.boldItalicfont: xft:Iosevka:style=Bold Italic:size=8
URxvt.letterSpace: 0
URxvt.lineSpace: 0
URxvt.geometry: 92x24
URxvt.internalBorder: 24
URxvt.cursorBlink: true
URxvt.cursorUnderline: false
URxvt.saveline: 2048
URxvt.scrollBar: false
URxvt.scrollBar_right: false
URxvt.urgentOnBell: true
URxvt.depth: 24
URxvt.iso14755: false

!! Common Keybinds for Navigations
URxvt.keysym.Shift-Up: command:\033]720;1\007
URxvt.keysym.Shift-Down: command:\033]721;1\007
URxvt.keysym.Control-Up: \033[1;5A
URxvt.keysym.Control-Down: \033[1;5B
URxvt.keysym.Control-Right: \033[1;5C
URxvt.keysym.Control-Left: \033[1;5D

!! Copy Paste & Other Extensions
URxvt.perl-ext-common: default,clipboard,url-select,keyboard-select
URxvt.copyCommand: xclip -i -selection clipboard
URxvt.pasteCommand: xclip -o -selection clipboard
URxvt.keysym.M-c: perl:clipboard:copy
URxvt.keysym.M-v: perl:clipboard:paste
URxvt.keysym.M-C-v: perl:clipboard:paste_escaped
URxvt.keysym.M-Escape: perl:keyboard-select:activate
URxvt.keysym.M-s: perl:keyboard-select:search
URxvt.keysym.M-u: perl:url-select:select_next
URxvt.urlLauncher: firefox
URxvt.underlineURLs: true
URxvt.urlButton: 1

```

(visit https://terminal.sexy to get some colorscheme examples)
You can get the xft name using fc-list command.

**Keybindings**

- `Shift Up` to scroll one line higher
- `Shift Down` to scroll one line lower
- `Control Left` to jump to the previous word
- `Control Right` to jump to the next word
- `Alt C` to copy
- `Alt V` to paste
- `Alt ESC` to "activate" ?
- `Alt S` to search
- `Alt U` url select

**Get XFT Font Format**

```
fc-list | grep "Iosevka"
```

Replace Iosevka with the other font name you want. Letterspace variable handles the space between characters. Linespace variable handles the linespacing between characters vertically. Geometry handles the URxvt size on launch. InternalBorder handles the terminal paddings, for aesthetic reason. But don’t set the paddings too much, we should care about usability too.

**After Configurations**

Don’t forget, after modifying ~/.Xresources file, You need to reload it using `xrdb ~/.Xresources` command. And the change of URxvt will be applied on next launch.

...

## Install oh my szh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

powerlevel10k theme

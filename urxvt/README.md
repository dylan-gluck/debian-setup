# URXVT Setup

## Download Fonts

Download fonts & Load them. Reference: https://addy-dclxvi.github.io/post/bitmap-fonts/

```
git clone https://github.com/addy-dclxvi/bitmap-font-collections.git ~/.fonts/misc; xset +fp ~/.fonts/misc/
```

## Setup urxvt

Clone urxvt-perls. Enter the urxvt-perls folder, then copy keyboard-select, clipboard, and url-select to `~/.urxvt/ext`

```
git clone https://github.com/muennich/urxvt-perls
```

Now create a file called `~/.Xresources`. Copy from example.

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

```
xrdb ~/.Xresources
```

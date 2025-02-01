# Dotfiles
Personal repository of various linux dotfiles. These are meant for my own configuration and may not be ideal for you.

## Bootstrap

```
# Download & Run config-root.sh
sh -c "$(curl -fsSL https://raw.github.com/dylan-gluck/debian-setup/main/config-root.sh)"

# Add main user to sudo group
usermod -aG sudo [user]

# Login as non-root user
su [user]

# Download git repo, run install script
cd ~
git clone https://github.com/dylan-gluck/debian-setup
cd debian-setup
chmod +x ./config-user.sh && ./config-user.sh
```

# General Configuration Guide for Linux

- [Englist](./README.md) | [中文](./docs/README.zh-CN.md)

## 一、Software that needs to be installed
- git 
- stow 
- zsh 
- kitty 
- terminator 
- anaconda or miniconda

## 二、Configuration and optimization

### 1.oh-my-zsh
- In the "dotfiles" project, oh-my-zsh is a sub project that can be directly installed through a soft connection
```sh
# Pull the dotfiles project from GitHub
mkdir -p ~/Documents/github
git clone https://github.com/ZavierPei/dotfiles.git ~/Documents/github/dotfiles --recurse-submodules

# Enter the dotfiles directory
cd ~/Documents/github/dotfiles

# Switch to zsh
/bin/zsh

# Modify default shell
chsh -s /bin/zsh

# Link oh-my-zsh and configuration files 
stow -t ~ oh-my-zsh

# Install plugins and themes
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# If GitHub cannot be accessed, you can use a backup address on Gitee
# Project address
git clone https://gitee.com/ZavierPei/dotfiles.git ~/Documents/github/dotfiles --recurse-submodules
# Plugin address
git clone https://gitee.com/qingmengfengyun/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitee.com/qingmengfengyun/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/qingmengfengyun/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Use configuration
source ~/.zshrc
```

**If the powerlevel10k font is missing, you can go to [powerlevel10k-media](https://gitee.com/qingmengfengyun/powerlevel10k-media)Download the four files ending in ".ttf", create a new directory named "~/. local/share/fonts/ttf/MesloLGS NF", and store the downloaded files in this directory**


### 2.neovim

- [Neovim Official GitHub Address](https://github.com/neovim/neovim)

#### Installation method
- Download the corresponding Neovim installation package based on the system version, unzip it, and store it under "/opt/nvim-linux64"
- Create a soft connection in "~/.local/bin"
```sh
ln -s /opt/nvim-linux64/bin/nvim ~/.local/bin/
```

### 3.lunarvim
- [Lunarvim Official Installation Document](https://www.lunarvim.org/zh-Hans/docs/installation)
#### a.Preconditions
- Please ensure that you have the latest version of Neovim v0.9.5.
- Install git, make, pip, python, npm, node, cargo, gcc, fd, and lazygit on the system.
- You can download it using the package management tool of the corresponding system, or install it through Homebrew.
#### b.Installation command
```sh
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```
- $HOME/.config/lvim：Personalized configuration file for lvim.
- $HOME/.local/bin/lvim：The executable file of lvim.
- $HOME/.cache/lvim：cache directory for lvim.
- $HOME/.config/lvim.old：Possible backup of lvim personalized files.
#### c.Uninstall command
```sh
rm -rf ~/.config/lvim \  
       ~/.local/share/lunarvim \  
       ~/.local/bin/lvim \  
       ~/.config/lvim.old \  
       ~/.cache/lvim 
```


### 4.Installation of gnome-yaru theme
- Software required programs：git、meson、sassc、inkscape、optipng、ruby.
- On the Debian/Ubuntu system, it is necessary to install libgtk-4-dev and libgio-2.0-dev.
- Installation of glib2 level is required on Red Hat/CentOS system.
```sh
git clone https://github.com/ubuntu/yaru.git
cd yaru

# Initialize build system (only required once per repo)
meson build
cd build

# Build and install
sudo ninja install

# Backup address
git clone https://gitee.com/qingmengfengyun/yaru.git
```

### 5.Gnome Desktop Optimization
- Required programs：gnome-tweaks、gnome-shell-extensions
#### Essential plugins
- `Dash to Dock`  
Quickly launch applications and switch between Windows and desktop faster
- `NetSpeed`  
Display network speed, memory, battery usage, etc
- `User Themes`  
Load theme plugin
- `AppIndicator and KStatusNotifierItem Support`  
Status bar plugin
- `Blur my Shell`  
Background Transparent Plugin
- `Hide Top Bar`  
Hide the status bar plugin


## 三、appendix

### 1.SSH service activation method
```sh
# Install SSH service
sudo dnf install openssh-server

# Start SSH service
sudo systemctl start sshd

# Automatically run SSH service at system startup
sudo systemctl enable sshd

# Check SSH service status
sudo systemctl status sshd
```

### 2.vmtools boot mount command
- Virtual machine automatically mounts host path upon startup
- Need to use crontab
```sh
sudo crontab -e
# Enter the following command
@reboot mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
```

### 3.Add SSH key
- Generate SSH key
```sh
ssh-keygen -t rsa -b 4096
```
- If you need to specify a key name (such as "gitkey"), you need to add the following content in the config
```sh
# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/gitkey

# gitee
Host gitee.com
HostName gitee.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/gitkey
```

### 4.fish shell配置
- Fish shell installation and optimization configuration process
```sh
# install fish shell
sudo dnf install fish

# install oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Associated configuration files
cd ~/Documents/github/dotfiles && stow -t ~ fish
```
- **[oh-my-fish official GitHub address](https://github.com/oh-my-fish/oh-my-fish)**
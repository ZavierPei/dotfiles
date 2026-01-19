# Linux通用配置指南

- [Englist](../README.md) | [中文](./README.zh-CN.md)

## 一、需要安装软件
- git 
- stow 
- zsh 
- kitty 
- terminator 
- anaconda或miniconda

## 二、配置和优化 

### 1.oh-my-zsh
- 在"dotfiles"项目中，oh-my-zsh是其子项目,可以直接通过软连接安装
```sh
# 从github拉取dotfiles项目
mkdir -p ~/Documents/github
git clone https://github.com/ZavierPei/dotfiles.git ~/Documents/github/dotfiles --recurse-submodules

# 进入dotfiles目录
cd ~/Documents/github/dotfiles

# 切换到zsh
/bin/zsh

# 修改默认shell
chsh -s /bin/zsh

# 链接oh-my-zsh及配置文件 
stow -t ~ oh-my-zsh

# 安装插件和主题
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# 如果github无法访问，可以用gitee备用地址
# 项目地址
git clone https://gitee.com/ZavierPei/dotfiles.git ~/Documents/github/dotfiles --recurse-submodules
# 插件地址
git clone https://gitee.com/qingmengfengyun/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitee.com/qingmengfengyun/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/qingmengfengyun/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# 使用配置
source ~/.zshrc
```

**如果powerlevel10k字体缺失，可以到[powerlevel10k-media](https://gitee.com/qingmengfengyun/powerlevel10k-media)下载.ttf结尾的四个文件，新建"~/.local/share/fonts/ttf/MesloLGS NF"目录，并将下载的文件存放到这个目录下即可**


### 2.neovim

- [neovim官方github地址](https://github.com/neovim/neovim)

#### 安装方法
- 根据系统版本下载对应neovim安装包，解压后存放在"/opt/nvim-linux64"下面
- 在`~/.local/bin`中创建软连接
```sh
ln -s /opt/nvim-linux64/bin/nvim ~/.local/bin/
```

### 3.lunarvim
- [lunarvim官方安装文档](https://www.lunarvim.org/zh-Hans/docs/installation)
#### a.前置条件
- 请确保拥有最新版本的 Neovim v0.9.5+.
- 在系统上安装 git、make、pip、python、npm、node、cargo、gcc、fd和lazygit.
- 可以使用对应系统的包管理工具下载，或者通过homebrew安装.
#### b.安装命令
```sh
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```
- $HOME/.config/lvim：lvim的个性化配置文件；
- $HOME/.local/bin/lvim：lvim的执行文件；
- $HOME/.cache/lvim：lvim的缓存目录；
- $HOME/.config/lvim.old：可能存在的lvim个性化文件备份
#### c.卸载命令
```sh
rm -rf ~/.config/lvim \  
       ~/.local/share/lunarvim \  
       ~/.local/bin/lvim \  
       ~/.config/lvim.old \  
       ~/.cache/lvim
```


### 4.gnome-yaru主题安装
- 软件所需程序：git、meson、sassc、inkscape、optipng、ruby
- 在Debian/Ubuntu系统上需要安装：libgtk-4-dev、libgio-2.0-dev
- 在Red Hat/CentOS系统上需要安装：glib2-devel
```sh
git clone https://github.com/ubuntu/yaru.git
cd yaru

# Initialize build system (only required once per repo)
meson build
cd build

# Build and install
sudo ninja install

# 备用地址
git clone https://gitee.com/qingmengfengyun/yaru.git
```

### 5.gnome桌面优化
- 所需程序：gnome-tweaks、gnome-shell-extensions
#### 必备插件
- `Dash to Dock`  
快速启动应用程序，更快地在 windows 和桌面之间切换
- `NetSpeed`  
显示网速、内存、电池用量等等
- `User Themes`  
加载主题插件
- `AppIndicator and KStatusNotifierItem Support`  
状态栏插件
- `Blur my Shell`  
背景透明插件
- `Hide Top Bar`  
隐藏状态栏插件


## 三、附录

### 1.ssh服务启用方式
```sh
# 安装SSH服务
sudo dnf install openssh-server

# 启动SSH服务
sudo systemctl start sshd

# 使SSH服务在系统启动时自动运行
sudo systemctl enable sshd

# 检查SSH服务状态
sudo systemctl status sshd
```

### 2.vmtools开机挂载命令
- 虚拟机开机自动挂载主机路径
- 需要使用crontab工具
```sh
sudo crontab -e
# 输入以下命令
@reboot mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
```

### 3.添加ssh密钥
- 生成ssh密钥
```sh
ssh-keygen -t rsa -b 4096
```
- 如果需要指定密钥名(如“gitkey”)，则需要在config中添加如下内容
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
- fish shell安装和优化配置流程
```sh
# 安装fish shell
sudo dnf install fish

# 安装oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# 关联配置文件
cd ~/Documents/github/dotfiles && stow -t ~ fish
```
- **[oh-my-fish官方github地址](https://github.com/oh-my-fish/oh-my-fish)**


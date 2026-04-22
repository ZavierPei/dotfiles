if status is-interactive
    # Commands to run in interactive sessions can go here
end

# 快捷方式
alias j="z"
alias l="ls"
alias c="cd"
alias e="exit"
alias vzc="v ~/.config/fish/config.fish"
alias szc="source ~/.config/fish/config.fish"
alias sur="su - root"
alias jg="cd ~/Documents/github"
alias jh="cd ~/Documents/github/dotfiles"
alias cl="clear"
alias h="history"

# 工具快捷方式
alias py="python"
alias ra="ranger"
alias v='bash -c '\''my_vim=""; if command -v lvim >/dev/null 2>&1; then my_vim="lvim"; else if command -v nvim >/dev/null 2>&1; then my_vim="nvim"; else my_vim="vim"; fi; fi; if [ $# -gt 0 ]; then $my_vim "$@"; else $my_vim .; fi'\'' bash'
alias icat="kitty +kitten icat"
alias kdiff="kitty +kitten diff"

# git快捷键
alias gcam="git commit -am"
alias glo="git log --oneline"
alias gst="git status"
alias gsw="git switch"
alias grv="git remote -v"
alias gra="git remote add"
alias grrm="git remote remove"
alias grmv="git remote rename"

# docker快捷键
alias dils="docker images"
alias dirm="docker rmi"
alias dcls="docker ps"
alias drm="docker rm"
alias dclsa="docker ps -a"
alias dxcit="docker exec -it"
alias dxcitf="docker exec -it fedora fish"

# Linux命令别名
#alias aguu="sudo apt update && sudo apt upgrade"
#alias agi="sudo apt install"
#alias agr="sudo apt remove"
#alias ags="sudo apt search"
alias dnfu="sudo dnf update && sudo dnf upgrade"
alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"
alias dnfs="sudo dnf search"

# 快速返回上级目录
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

# 配置环境变量
set -x PATH $HOME/.local/bin $PATH

# ===== 启动命令 =====
# 欢迎信息
function fish_greeting
    echo "Hello Zavier!"
    echo "欢迎使用 Fish shell 🐟"
    echo "时间: $(date)"
end

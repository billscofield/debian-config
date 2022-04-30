echo "~/.zshrc"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/bill/.oh-my-zsh"
  export ZSH="/root/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
# systemctl edit --full
export SYSTEMD_EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto -F'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias s='ls'
alias sl='ls'
alias s='ls -lt'
alias lsl='ls -l'
alias ll='ls -l'
alias lls='ll'
alias lla='ll -a'
alias rmf='rm -f'
alias rmrf='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias viu='vim -u NONE'
##alias j = 'autojump'

#Bill vi
set -o vi
#bind -m vi-insert '\c-l':clear-screen
#
#less preprocessor to handle deb

export LESSOPEN="|lesspipe %s"

# keymap only for tapboard
# scancodes(hex)    keycode
# it seems like this doesn't work for usb keyboard
#setkeycodes db 58   # leftmeta to capslock
#setkeycodes 3a 125  # capslock to leftmeta
#setkeycodes 1d 56   # leftctrl to leftalt
#setkeycodes 38 29   # leftalt to leftctrl



# to disable Ctrl s in terminal
stty -ixon

# export PATH=/bin:/usr/bin:/usr/local/bin:$PATH
#
# export PATH=$PATH:/usr/games/

# mate-screenshot alias
# alias shot='mate-screenshot'

#feh --bg-scale /root/Downloads/wp2118526-219-wallpapers.jpg
feh --bg-max /root/Downloads/nW3L1yZ-full-black-wallpaper.jpg


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
#export SDK_IM_MODULE=ibus

#ibus-daemon -d -x
# has to run ibus-daemon manually, 否则 urxvt 还是不能输入汉字


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node

[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


export PATH=$PATH:/usr/sbin

export PATH=/usr/sbin:/usr/local/vimPython3/bin/:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv virtualenv-init -)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export MYVIMRC=/root/.vimrc



export PYTHON_CONFIGURE_OPTS="--enable-shared"
#export GOPATH=/root/go/
#export GOBIN=/root/go/gitee.com/goyougoodthing/bin/
#export GOPROXY=https://mirrors.aliyun.com/goproxy/



#export GOPATH=/root/go/
#export GOBIN=/root/go/gitee.com/goyougoodthing/bin/
export GOPATH=/opt/go/bin/
export PATH=$PATH:${GOPATH}
# internal speed-up
export GOPROXY=https://mirrors.aliyun.com/goproxy/



#export PATH=$PATH:/usr/local/nodejs/node-v13.12.0-linux-x64/bin:/opt/go/bin/
export NODEPATH=/opt/node-v14.18.1-linux-x64/bin/
export PATH=$PATH:${NODEPATH}


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:/usr/local/shell_self"

# postman
export PATH=${PATH}:/opt/Postman

# blender
export PATH=${PATH}:/opt/blender



# xterm
# xrdb -merge /git/debian-config/xtermconfig



# qt
export QTVER=6.2.2
export QTDIR=/opt/Qt/
export PATH=${QTDIR}${QTVER}/gcc_64/bin/:$PATH
export PATH=${QTDIR}Tools/QtCreator/bin/:$PATH
export LD_LIBRARY_PATH=${QTDIR}${QTVER}/gcc_64/lib/:$LD_LIBRARY_PATH

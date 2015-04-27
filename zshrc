# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="jonathan"
#ZSH_THEME="robbyrussell"
ZSH_THEME="byrne"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
#################### oh my zsh #############################################################################################

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
IRBRC=$HOME/.irbrc

#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=10000
# number of lines saved in the history after logout
export SAVEHIST=10000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt INC_APPEND_HISTORY
#Disable core dumps
limit coredumpsize 0

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
autoload -U compinit
compinit
# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd
#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


############################################ ALIAS ##############################################################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsS='ls -lShr'
alias lst='ls -ltr'
alias less='less -R'

# tmux
export TERM=xterm-256color
alias tm='TERM=xterm-256color tmux -2'
alias tn='tm new -s'
alias tl='tm ls'
alias ta='tm attach'
alias tt='tm attach -t'

# less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

# diffmerge
alias diffmerge='/Applications/DiffMerge.app/Contents/MacOS/DiffMerge'

# proxy
alias proxyon='export http_proxy=106.186.118.77:7128 && export https_proxy=106.186.118.77:7128 && echo cli http proxy on'
alias proxyoff='unset http_proxy && unset https_proxy && echo cli http proxy off'
########################################## Others ########################################################################
# Customize to your needs...
export VISUAL=vi
export EDITOR=vi
export SVN_EDITOR=vi

set -o emacs
#set -o vi

# homebrew
export PATH=/usr/local/sbin:$PATH

# flash related
export ASHOLE_HOME=$HOME/.ashole
export PATH=$ASHOLE_HOME/bin:$PATH
export FLEX_HOME=$ASHOLE_HOME/saybot/sdk/flex
export FLEX_SDK_BIN="$FLEX_HOME/bin"
export ANT_OPTS="-Dfile.encoding=UTF-8"
export AIR_SDK_HOME=$ASHOLE_HOME/saybot/sdk/air
export PATH=$PATH:$AIR_SDK_HOME/bin

export PATH=$HOME/bin:/usr/local/mysql/bin:/usr/local/bin:$PATH

#android
export ANDROID_SDK_HOME=$HOME/.android-sdk-macosx
export PATH=$PATH:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools
export ANDROID_NDK_HOME=$HOME/android-ndk
export PATH=$PATH:$ANDROID_NDK_HOME
export PHONEGAP_HOME=$HOME/tools/phonegap
export PATH=$PATH:$PHONEGAP_HOME/lib/android/bin

# JAVA
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JAVA_OPTS="-Dfile.encoding=UTF-8"
export ANT_OPTS="-Dfile.encoding=UTF-8"


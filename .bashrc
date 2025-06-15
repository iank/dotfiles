#### More or less standard Debian stuff

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# window size
shopt -s checkwinsize

# Set up lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ls and grep color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#### End of standard Debian stuff

# Bump this up a little bit
HISTSIZE=10000
HISTFILESIZE=20000

# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_VIRTUALENV=/home/ian/.local/bin/virtualenv
    source ~/.local/bin/virtualenvwrapper.sh
fi

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Editor
NEOVIM_PATH=$HOME/nvim-linux64/bin/nvim
if [ -x $NEOVIM_PATH ]; then
    alias vi=$NEOVIM_PATH
    export EDITOR=$NEOVIM_PATH
else
    export EDITOR=vim
fi
unset NEOVIM_PATH

PATH=$PATH:$HOME/.local/bin

if [ -f ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

shopt -s histverify

source ~/.config/fzf/key-bindings.bash
source ~/.config/keys.sh

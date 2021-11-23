# Unless we're running as root, set up our runtime environment.
[ $(id -u) -ne 0  -a -f "$HOME/setenv" ] && . "$HOME/setenv"

# Everything below this point is strictly for human comfort on those
# occasions when we need to connect to the running container.

# Cyan PWD followed by yellow $ or # for prompt.
if [ $(id -u) -eq 0 ]; then
  export PS1='\[\e[0;31m\]\w\[\e[33m\]\$\[\e[0m\] '
else
  export PS1='\[\e[0;32m\]\w\[\e[36m\]\$\[\e[0m\] '
fi

# Turn on vi-like command line editing.
set -o vi

# We're not barbarians.
export PAGER='/usr/bin/less -R'
export EDITOR=/usr/bin/vim

# Make ls a little nicer, and give it some helpers.
alias ls='/bin/ls --color=auto'
alias ll='ls -lF'
alias lla='ll -a'
alias lld='ll -d'
alias llh='ll -h'
alias lrt='ll -rt'

alias vi='vim '

# Usage: lrtail [tail option] [directory]
function lrtail {
  local tail_opt=''
  if [[ "$1" =~ "^-.*" ]]; then
    tail_opt="$1"
    shift
  fi
  ls -lrt $@ | tail $tail_opt
}

# Connect to Mage's database as gtmage.
function m {
  cmd="psql -h magedb.gatech.edu mage gtmage"
  if [ $(id -u) -eq 0 ]; then
    su - mage -c "$cmd"
  else
    $cmd
  fi
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# this is from standard bashrc, don't even know what all that means
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

# LS_COLORS setup
if [[ ! -z "$TMUX" ]]; then
    # this runs only under tmux because if I run this outside
    # that will ruin KDE for some reason - it look like it has some
    # too small limits and it chokes on such a big variable
    # at startup time
    export LS_COLORS=$(vivid generate gruvbox-dark)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# friendly history stuff
# this should fix history by removing duplicates and yet preserves chronology
alias hfix='history -n && history | sort -k2 -k1nr | uniq -f1 | sort -n | cut -c8- > ~/.tmp$$ && history -c && history -r ~/.tmp$$ && history -w && rm ~/.tmp$$'
# this part will merge all history upon exit
# it also ensures that when we do tmux kill-server bashes will save their history
# in serial manner and we will not loose any history lines
function historymerge {
    (
        flock 99
        echo "begin historymerge" >> ~/.bash_history_update.log
        history -n; history -w; history -c; history -r;
        echo "end historymerge" >> ~/.bash_history_update.log
        flock -u 99
    ) 99>/var/lock/bashhistory-$USER
}
trap historymerge EXIT SIGHUP

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fzf tab completion
if [ -f ~/.fzf-tab-completion/bash/fzf-bash-completion.sh ]; then
    source ~/.fzf-tab-completion/bash/fzf-bash-completion.sh
    bind -x '"\t": fzf_bash_completion'
fi

# zoxide for z
eval "$(zoxide init bash)"

# powerline
# dont use powerline under MC shell - it looks baaad
if [ -z "${MC_SID}" ]; then
    # need to cache location because pip invocation is quite costly
    powerline_cached_location="$HOME/.cache/powerline-status-dist-path"
    if [ -e $powerline_cached_location ]; then
        powerline_dist_path=$(<$powerline_cached_location)
    else
        powerline_dist_path=`pip show powerline-status 2>/dev/null | egrep "^Location:" | cut -d ' ' -f 2 | tee $powerline_cached_location`
    fi
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    export POWERLINE_CONFIG_PATHS=$powerline_dist_path/powerline/config_files:~/.config/powerline:~/.config/powerline.local
    export POWERLINE_DIST_PATH="$powerline_dist_path"
    source $powerline_dist_path/powerline/bindings/bash/powerline.sh
fi

if [[ -z "$TMUX" ]]; then
    hostname=$(hostname)

    virt=$(systemd-detect-virt)
    if [[ "$virt" != "none" ]]; then
        hostname="$virt($hostname)"
    fi

    if [[ ! -z "$SSH_CLIENT" ]]; then
        hostname="ssh($hostname)"
    fi

    export POWERLINE_CONDITIONAL_HOST="$hostname"
else
    export -n POWERLINE_CONDITIONAL_HOST
fi

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi


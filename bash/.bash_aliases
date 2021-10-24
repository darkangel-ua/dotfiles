# system
alias tree='tree -I .git'
alias l='ls -lh --group-directories-first'
alias ll='ls -ahl --group-directories-first'

# git
alias gs='git status'
alias gch='git checkout "$(git branch -a | fzf | tr -d '[:space:]')"'

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

# system
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias tree='exa --group-directories-first --tree --icons -I .git'
alias l='exa -lg --group-directories-first --icons'
alias ll='exa -lga --group-directories-first --icons'

# git
alias gs='git status'
alias gch='git checkout "$(git branch -a | fzf | tr -d '[:space:]')"'
alias gsu='git submodule update --init --recursive'

[ -f ~/.bash_aliases.local ] && source  ~/.bash_aliases.local

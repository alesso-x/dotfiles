# alias d='docker'
# alias dm='docker-compose'
# alias k='kubectl'
alias ls='/usr/local/bin/gls --color -h --group-directories-first'
alias tmux='tmux -f ~/.config/.tmux.conf'

alias pull-repos='find . -type d -depth 1 -print -exec git --git-dir={}/.git --work-tree=$PWD/{} delete-merged \;'
alias delete-pyc='find . -name "*.pyc" -delete'

alias xc="open *.xcodeproj"
alias xcw="open *.xcworkspace"

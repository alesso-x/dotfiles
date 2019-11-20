alias ls='/usr/local/bin/gls --color -h --group-directories-first'
alias ll='/usr/local/bin/gls --color -h --group-directories-first -la'
alias pull-repos='find . -type d -depth 1 -print -exec git --git-dir={}/.git --work-tree=$PWD/{} delete-merged \;'

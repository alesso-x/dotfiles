alias ls='/usr/local/bin/gls --color -h --group-directories-first'
alias pull-repos='find . -type d -depth 1 -print -exec git --git-dir={}/.git --work-tree=$PWD/{} delete-merged \;'

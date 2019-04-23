set -gx XDG_CONFIG_HOME $HOME/.config
set -gx VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/.vimrc" | source $MYVIMRC'

fenv source ~/dotfiles/.environment_vars.sh
bass source ~/dotfiles/.aliases.sh

# path
set -x PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/gnu-getopt/bin /usr/local/opt/gnu-sed/libexec/gnubin $PATH /Users/alesso/.local/bin /usr/local/sbin

# direnv, asdf
eval (direnv hook fish)
source /usr/local/opt/asdf/asdf.fish

# gcloud
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# django auto completion
__fish_complete_django django-admin.py
__fish_complete_django manage.py

complete -c cht.sh -xa '(curl -s cheat.sh/:list)'

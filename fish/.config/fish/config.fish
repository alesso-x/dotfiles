# fish
set fish_greeting  # Disable fish greeting

# path
set -ax PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin

# environment vars and aliases
fenv source ~/dotfiles/.environment_vars.sh
bass source ~/dotfiles/.aliases.sh

# vim
set -gx VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/.vimrc" | source $MYVIMRC'

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global k kubectl
    abbr --add --global d docker
    abbr --add --global dm docker-compose
end

# direnv, asdf
eval (direnv hook fish)
source /usr/local/opt/asdf/asdf.fish

# gcloud
# set -ax PATH /usr/local/opt/gnu-getopt/bin  # brew install gnu-getopt
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# django completions
__fish_complete_django django-admin.py
__fish_complete_django manage.py

# pipx completions
register-python-argcomplete --shell fish pipx | .

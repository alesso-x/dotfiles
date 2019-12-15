# fish
set fish_greeting  # Disable fish greeting

# path
set -ax PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin

# environment vars and aliases
fenv source $HOME/dotfiles/.environment_vars.sh
fenv source $HOME/dotfiles/.xdg_environment_vars.sh
bass source $HOME/dotfiles/.aliases.sh

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
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# django completions
__fish_complete_django django-admin.py
__fish_complete_django manage.py

# pipx completions
register-python-argcomplete --shell fish pipx | .

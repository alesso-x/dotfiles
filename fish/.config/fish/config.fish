fenv source $HOME/dotfiles/.environment_vars.sh
fenv source $HOME/dotfiles/.xdg_environment_vars.sh
bass source $HOME/dotfiles/.aliases.sh
set fish_greeting  # Disable fish greeting

# path
set --prepend PATH \
    /usr/local/opt/sqlite/bin

set --append PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin \
    $HOME/dotfiles/.bin

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global k kubectl
    abbr --add --global d docker
    abbr --add --global dm docker-compose
end

# django completions
# https://github.com/Duncaen/fish-django-completions
__fish_complete_django django-admin.py
__fish_complete_django manage.py

# direnv, asdf
eval (direnv hook fish)
source /usr/local/opt/asdf/asdf.fish
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish  # JAVA_HOME

# pipx completions
register-python-argcomplete --shell fish pipx | .

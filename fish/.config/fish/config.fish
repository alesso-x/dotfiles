set fish_greeting  # Disable fish greeting
set -gx DOTFILES_HOME $HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh

# path
set --prepend PATH \
    /usr/local/opt/sqlite/bin \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/findutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin

set --append PATH \
    $HOME/.local/bin \
    $DOTFILES_HOME/.bin \
    $HOME/go/bin/

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global k kubectl
    abbr --add --global kc kubectx
    abbr --add --global kn kubens
    abbr --add --global d docker
    abbr --add --global dm docker-compose
    abbr --add --global h hist_delete
    abbr --add --global l ls
    abbr --add --global do doctl
end

# django completions
__fish_complete_django django-admin
__fish_complete_django manage.py

# direnv, asdf
eval (direnv hook fish)
source /usr/local/opt/asdf/asdf.fish
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish  # JAVA_HOME
source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish  # DOTNET_ROOT

# pipx completions
register-python-argcomplete --shell fish pipx | source

source $DOTFILES_HOME/_private/work_config.fish

set fish_greeting  # Disable fish greeting
set -gx DOTFILES_HOME $HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh
source $DOTFILES_HOME/_private/work_config.fish

# prompt
starship init fish | source

# path
# echo $fish_user_paths or echo $PATH
fish_add_path --prepend \
    $HOMEBREW_PREFIX/bin \
    $HOMEBREW_PREFIX/opt/curl/bin \
    $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin \
    $HOMEBREW_PREFIX/opt/findutils/libexec/gnubin \
    $HOMEBREW_PREFIX/opt/gnu-getopt/bin \
    $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin

fish_add_path --append \
    $HOME/.local/bin \
    $DOTFILES_HOME/.bin \
    $HOME/go/bin/

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global d docker
    abbr --add --global dm docker-compose
    abbr --add --global do doctl
    abbr --add --global g git
    abbr --add --global h hist_delete
    abbr --add --global k kubectl
    abbr --add --global kc kubectx
    abbr --add --global kn kubens
    abbr --add --global l ls
end

# django completions
__fish_complete_django django-admin
__fish_complete_django manage.py

# direnv
direnv hook fish | source

# asdf
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.fish
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish  # JAVA_HOME

# pipx completions
register-python-argcomplete --shell fish pipx | source

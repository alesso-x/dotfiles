set fish_greeting  # Disable fish greeting
set -gx DOTFILES_HOME $HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.xdg_environment_vars.sh
source $DOTFILES_HOME/_private/vars.sh
source $DOTFILES_HOME/.aliases.sh

# path
set --prepend PATH \
    /usr/local/opt/sqlite/bin

set --append PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin \
    $DOTFILES_HOME/.bin

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global k kubectl
    abbr --add --global d docker
    abbr --add --global dm docker-compose
    abbr --add --global h hist_delete
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

# Enable AWS CLI autocompletion: https://github.com/aws/aws-cli/issues/1079#issuecomment-541997810
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Gcloud autocomplete: https://stackoverflow.com/a/53603913/5054458
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# coreutils, gnu-sed, hatch
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/gnu-sed/libexec/gnubin $PATH /Users/alesso/.local/bin

# aws cli completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

alias d "docker"
alias dm "docker-compose"
alias k "kubectl"

source /usr/local/opt/asdf/asdf.fish

# django
__fish_complete_django django-admin.py
__fish_complete_django manage.py

eval (direnv hook fish)

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

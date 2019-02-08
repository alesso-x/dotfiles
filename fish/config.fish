set -g -x PATH $PATH /Users/alesso/.local/bin

# aws cli completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

alias dk "docker"
alias dm "docker-compose"

source /usr/local/opt/asdf/asdf.fish

# django
__fish_complete_django django-admin.py
__fish_complete_django manage.py

eval (direnv hook fish)

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

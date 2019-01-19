eval (direnv hook fish)
set -g -x PATH $PATH /Users/alesso/.local/bin

# aws cli completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

set EDITOR code

alias dk "docker"
alias dm "docker-compose"

source /usr/local/opt/asdf/asdf.fish

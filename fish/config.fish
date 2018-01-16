status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

# aws cli completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

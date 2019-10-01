# retrieve command cheat sheets from cheat.sh
# https://cheat.sh/ i.e. curl cht.sh/curl
# https://github.com/chubin/cheat.sh/issues/3 -> https://github.com/Dagefoerde/dotfiles/blob/mate/fish/own_functions/cheat.fish
function cheat
    curl cheat.sh/$argv
end
# register completions (on-the-fly, non-cached, because the actual command won't be cached anyway
complete -c cheat -xa '(curl -s cheat.sh/:list)'

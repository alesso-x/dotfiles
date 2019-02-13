# Lookup flag in man page
# https://stackoverflow.com/a/24967501/5054458
function manopt
  set -l cmd $argv[1]
  set -l opt $argv[2]
  if not echo $opt | grep '^-' >/dev/null
    if [ (string length $opt) = 1 ]
      set opt "-$opt"
    else
      set opt "--$opt"
    end
  end
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
end

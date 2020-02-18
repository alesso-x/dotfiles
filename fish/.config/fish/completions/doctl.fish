# http://fishshell.com/docs/current/index.html#writing-your-own-completions

set -l commands account auth balance compute databases help kubernetes projects version

# Commands:
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a account -d "account commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a auth -d "auth commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a balance -d "balance commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a compute -d "compute commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a databases -d "database command"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a help -d "Help about any command"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a kubernetes -d "kubernetes commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a projects -d "projects commands"
complete -c doctl -f -n "not __fish_seen_subcommand_from $commands" -a version -d "show the current version"

# Flags
complete -c doctl --no-files -s t -l access-token -d "API V2 Access Token"
complete -c doctl --no-files -s u -l api-url -d "Override default API V2 endpoint"
complete -c doctl --no-files -s c -l config -d "config file"
complete -c doctl --no-files -l context -d "authentication context"
complete -c doctl --no-files -s h -l help -d "help for doctl"
complete -c doctl --no-files -s o -l output -d "output format [text|json] (default \"text\")"
complete -c doctl --no-files -l trace -d "trace api access"
complete -c doctl --no-files -s v -l verbose -d "verbose output"

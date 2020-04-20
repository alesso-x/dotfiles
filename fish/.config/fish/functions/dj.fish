function dj --wraps docker-compose
    # export environment variables to hide docker-compose env warnings
    export (cat $HOME/workspace/dev/.env)
    genv -C $HOME/workspace/dev/ docker-compose --env-file $HOME/workspace/dev/.env $argv
end

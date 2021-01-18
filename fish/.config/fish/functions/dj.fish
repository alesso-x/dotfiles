function dj --wraps docker-compose
    # export environment variables to hide docker-compose env warnings
    export (cat $HOME/workspace/dev/.env)
    # TODO: check for arg "upd" and use the USE_CONTAINERS
    genv -C $HOME/workspace/dev/ docker-compose --env-file $HOME/workspace/dev/.env $argv
end

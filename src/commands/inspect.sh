function cmd_inspect() {
    ARGS="$@"
    on_docker_host "docker inspect $ARGS \$CONTAINER"
    exit $? # No more commands allowed, because we consume $@
}


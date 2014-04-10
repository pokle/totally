function cmd_interactive() {
    on_docker_host "set -x; docker run --rm -i -t $IMAGE $@"
    exit $? # No more commands allowed, because we consume $@
}


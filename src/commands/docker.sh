
function cmd_docker() {
    ARGS="$@"
    on_docker_host "docker $ARGS"
    exit $?
}


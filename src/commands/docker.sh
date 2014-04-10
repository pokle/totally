
function cmd_docker() {
    ARGS="$@"
    on_docker_host "set -x; docker $ARGS"
    exit $?
}



function cmd_docker() {
    ARGS="$@"
    on_docker_host "docker $ARGS"
    exit $?
}

function cmd_dockerni() {
    ARGS="$@"
    on_docker_host --non-interactively "docker $ARGS"
    exit $?
}

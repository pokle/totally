function cmd_interactive() {
    ssh -t $DOCKER_SSH_HOST "docker run --rm -i -t $IMAGE $@"
    exit $? # No more commands allowed, because we consume $@
}


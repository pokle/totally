#
# This is the main build workflow
#

function cmd_sync() {
    info Sync\'ing to $DOCKER_SSH_HOST

    on_docker_host "mkdir -p '$REMOTE_ROOT'" &&
    rsync --archive --delete $LOCAL_ROOT/$BUILD_DIR/ $DOCKER_SSH_HOST:$REMOTE_ROOT/$NAME/
}

function cmd_destroy() {
    info "Stopping and removing container"
    
    on_docker_host "
        function container_exists() { docker inspect --format '.' $CONTAINER > /dev/null 2>&1; }

        container_exists &&
            set -x
            docker stop $CONTAINER &&
            docker rm $CONTAINER
    "
}

function cmd_restart() {

    cmd_destroy  # Best effort. Don't care if it fails

    info "Starting container"
    
    on_docker_host "set -x; docker run --name $CONTAINER -d $IMAGE" &&
    
    info "SUCCESS. Run 'totally logs' to watch startup"
}

function cmd_build() {
    BUILD_COMMAND=${BUILD_COMMAND:-docker build -t $IMAGE .}

    if [ ! -z "$PRE_BUILD_CMDS" ]; then
        info "Running pre-build command"
        eval "$PRE_BUILD_CMDS" || die "Pre-build commands failed with error code $?"
    fi

    cmd_sync &&
    info "Building image" &&
    on_docker_host "cd $REMOTE_ROOT/$NAME && set -x && $BUILD_COMMAND"

}

function cmd_run() {
    cmd_build &&
    cmd_restart
}


#
# This is the main build workflow
#

function cmd_sync() {
    echo -- Sync\'ing to $DOCKER_SSH_HOST
    ssh $DOCKER_SSH_HOST "mkdir -p '$REMOTE_ROOT'"
    rsync --archive --delete $LOCAL_ROOT/$BUILD_DIR/ $DOCKER_SSH_HOST:$REMOTE_ROOT/$NAME/
}

function cmd_destroy() {
     ssh -t $DOCKER_SSH_HOST "
        function container_exists() { docker inspect --format '.' $CONTAINER > /dev/null 2>&1; }

        container_exists &&
            echo -n 'Stopping... ' && 
            docker stop $CONTAINER &&
            echo -n 'Removing... ' &&
            docker rm $CONTAINER" &&
    echo -- Destroyed $CONTAINER
}

function cmd_restart() {

    cmd_destroy  # Best effort. Don't care if it fails

    ssh -t $DOCKER_SSH_HOST "
		echo -n '-- Running $CONTAINER id '
		docker run --name $CONTAINER -d $IMAGE &&
	    echo -- SUCCESS. Run 'totally logs' to watch startup
	"
}

function cmd_build() {
    cmd_sync &&
    echo -- Building Docker image called $IMAGE on $DOCKER_SSH_HOST &&
    ssh $DOCKER_SSH_HOST "cd $REMOTE_ROOT/$NAME && docker build -t $IMAGE ." &&
    echo -- Build successful
}

function cmd_run() {
    cmd_build &&
    cmd_restart
}


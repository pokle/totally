function cmd_logs() {
    on_docker_host --non-interactively "
        echo -- Tailing logs for $CONTAINER. Hit ^C to stop
        while true; do
            docker logs --follow $CONTAINER 
            echo
            echo -- Restarting totally logs at $(date) ------ Hit ^C to stop -----------
            sleep 2
        done
    "
}


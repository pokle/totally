function cmd_tunnel() {
    
    local container_ip=$(ssh $DOCKER_SSH_HOST "docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER")
    [ -z "$container_ip" ] && 
        die "-- Can't get the IP address of your container. Is it running?"

    local container_ports=$(ssh $DOCKER_SSH_HOST "docker inspect --format='{{range \$p,\$c := .NetworkSettings.Ports}}{{\$p}},{{end}}' $CONTAINER | sed 's/\/tcp,/ /g'")
    [ -z "$container_ports" ] &&
        die "-- Sorry, no TCP container ports were found. Did you EXPOSE ports in your Dockerfile?"

    local container_port
    local tunnels

    for container_port in $container_ports; do
        echo "-- Tunneling localhost:$TUNNEL_PORT => $DOCKER_SSH_HOST => $container_ip:$container_port. Got HTTP? http://localhost:$TUNNEL_PORT/"
        tunnels="$tunnels -L $((TUNNEL_PORT++)):$container_ip:$container_port"
    done

    ssh $tunnels $DOCKER_SSH_HOST 'echo -- Your tunnels have been bored. Press ^C to close; sleep 3600'
}

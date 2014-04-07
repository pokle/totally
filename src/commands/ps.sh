
function cmd_ps() { on_docker_host 'docker top $CONTAINER'; }
function cmd_top() { cmd_ps; }


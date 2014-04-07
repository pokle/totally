function cmd_help() {

    cat <<-USAGE  >&2 
		usage: $0 COMMAND...

		Main build commands
		-------------
		 new TEMPLATE NAME
				 Creates a new project from a template on github.
				 Eg. totally new decoupled/microservice fluffy-cats
				 (That comes from https://github.com/decoupled/microservice

		 init    Creates a new project in an existing directory
		 run     Builds then runs your app
		 tunnel  Tunnels all app's exposed ports to your computer

		Troubleshooting commands
		------------------------
		 config       Show totally configuration environment
		 logs         Tails the console
		 destroy      Stops the container, and deletes it - losing data
		 restart      Destroys and starts the container with the latest image
		 inspect ARGS Shows you information about your container
		 top          Shows running processes  
		 ps 	      Same as top

		Ninja commands
		--------------
		 docker COMMAND ARGS 
			  Run a docker command on the server. Refer to your project's
			  configuration, such as the image name and container name using
			  escaped shell syntax. For example:

			  	totally docker wait \\\$CONTAINER

		 interactive ARGS 
		 	  Like run, but drops you into the container.
		      Examples: totally interactive bash 
		      		  : totally build interactive bash

		Auxilliary commands
		-------------------
		 verbose 	  For eg. a verbose build: 'totally verbose build'
		 build   	  Builds a Docker image

		Configuration
		-------------
		 NAME            Your project name
		 DOCKER_SSH_HOST A host to build and run your app on
		 REMOTE_ROOT     The temp. dir. on DOCKER_SSH_HOST to build in
		 TUNNEL_PORT     A base port number for your tunnels
		 IMAGE           The name of the Docker image that will be built
		 CONTAINER       The name of the Docker container to run your app as

		Chaining commands
		-----------------
		Most commands can be chained. Eg. 'totally run logs' runs your app, and
		then tails the logs. Commands that take arguments like inspect can be
		chained only if they are the last command called. 
		For eg. totally run inspect --format '{{.NetworkSettings.IPAddress}}'

	USAGE

    exit 1
}

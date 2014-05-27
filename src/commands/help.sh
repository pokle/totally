function cmd_help() {

    cat <<-USAGE  >&2
		Totally easy peasy lemon squeezy docker development workflow.

		- Edit your Dockerfile on your computer with your favourite editor (Even if it isn't Linux)
		- Totally takes care of getting your code running on your docker host - wherever it is.

		Learn more at https://github.com/pokle/totally


		usage: $0 COMMAND...

		Frequently used commands
		-------------
		 new TEMPLATE NAME
				 Creates a new project from a template on github.
				 Eg. totally new decoupled/microservice fluffy-cats
				 (That comes from https://github.com/decoupled/microservice

		 init    Creates a new project in an existing directory
		 build   Builds a Docker image of your app
		 run     Runs your app interactively - ^C to stop
		 daemon  Runs your app in the background
		 tunnel  Tunnels all app's exposed ports to your computer

		Troubleshooting commands
		------------------------
		 config       Show totally configuration environment
		 logs         Tails the console
		 destroy      Stops the container, and deletes it - losing data
		 restart      Destroys and starts the container with the latest image
		 top          Shows running processes

		Ninja commands
		--------------
		 docker COMMAND ARGS
			  Run a docker command on the server. Refer to your project's
			  configuration, such as the image name and container name using
			  escaped shell syntax. For example:

			  	totally docker wait \\\$CONTAINER

		Auxilliary commands
		-------------------
		 verbose 	  For eg. a verbose build: 'totally verbose build'
		 version	  Totally version. See https://github.com/pokle/totally/blob/master/CHANGELOG.md

		Configuration variables
		-----------------------
		 NAME            Your project name
		 DOCKER_SSH_HOST A host to build and run your app on
		 REMOTE_ROOT     The temp. dir. on DOCKER_SSH_HOST to build in
		 TUNNEL_PORT     A base port number for your tunnels
		 IMAGE           The name of the Docker image that will be built
		 CONTAINER       The name of the Docker container to run your app as
		 PRE_BUILD_CMDS  Bash commands to run locally before building the image

		Chaining commands
		-----------------
		Most commands can be chained. Eg. 'totally daemon logs' runs your app, and
		then tails the logs. Commands that take arguments can be chained only if
		they are the last command called.

	USAGE

    exit 1
}

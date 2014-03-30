Totally
=======

Totally runs a single container on a remote Docker host, and patches through any ports you require through ssh tunnels.

Pre-requisites
--------------
1. A host running Docker that you can ssh to without having to type in a password (with your key set up). Totally will ssh to the box, and expect to be able to connect to Docker on it.

			echo DOCKER_SSH_HOST=my-super-docker-fragalistic > ~/.totally

	If you want to specify ssh ports, users, keys, etc., do it in your ~/.ssh/config file. Here's how I connect to my CoreOS Vagrant VM on my laptop:

			Host my-super-docker-fragalistic
				User core
				IdentityFile ~/.ssh/coreos_insecure_ssh_key
				Host 192.168.67.144

2. Install tools on your local computer: rsync

Install
-------

		sudo curl https://github.com/pokle/totally/blob/master/totally -o /usr/local/bin/totally
		sudo chmod a+rx /usr/local/bin/totally

Examples
--------

1. Create a sample web app.

Create a Dockerfile with:

	FROM tianon/centos:6.5
	ADD . /app
	WORKDIR /app
	EXPOSE 8000
	CMD python -m SimpleHTTPServer 8000

And a little helpful index.html file in the same directory

	It worked!
	This image was built from this <a href="Dockerfile">Dockerfile</a>

2. Now deploy It

	$ totally deploy my-fancy-app
	# Uploading...
	# Building...
	# Running my fancy app on X.X.X.X
	# Ready.
	# You can connect to it on localhost at:
	PORT_80=PPPPP

	$ totally stop my-fancy-app


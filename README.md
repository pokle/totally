Totally
=======

Totally helps you rapidly deploy your apps to a Docker host. 

It works in a way that's amenable to continuous delivery. When you want to have the quickest feedback loop from code change to seeing your changes running. 

Totally also tunnels ports from your container running in the cloud to your laptop, so that you can quickly develop your apps. All that Totally needs is ssh access to a host running docker.

Pre-requisites
--------------
1. A host running Docker that you can ssh to without having to type in a password (with your key set up). Totally will ssh to the box, and expect to be able to connect to Docker on it.

			echo DOCKER_SSH_HOST=my-super-docker-fragalistic > ~/.totally

	If you want to specify ssh ports, users, keys, etc., do it in your ~/.ssh/config file. Here's how I connect to my CoreOS Vagrant VM on my laptop:

			Host my-super-docker-fragalistic
				User core
				IdentityFile ~/.ssh/coreos_insecure_ssh_key
				HostName 192.168.67.144

2. Install tools on your local computer: rsync

Install
-------

		sudo curl https://raw.githubusercontent.com/pokle/totally/master/totally -o /usr/local/bin/totally
		sudo chmod a+rx /usr/local/bin/totally

Guide
--------

1. Create a minimalist Hello World web app

			$ mkdir totally-hi
			$ cd totally-hi
			$ totally init
			Initialised new Totally project called totally-hi
	
	That just creates a shell file that you can add additional commands to later:

			$ cat .totally 
			NAME="totally-hi"

	Since this is meant to be a demo, lets create a simple python web app.

	Create a _Dockerfile_ with:

			FROM tianon/centos:6.5
			ADD . /app
			WORKDIR /app
			EXPOSE 8000
			CMD python -m SimpleHTTPServer 8000

	And a little helpful _index.html_ file in the same directory:

			It worked!
			This image was built from this <a href="Dockerfile">Dockerfile</a>

	Try running it locally to see what it does if you like:

			$ python -m SimpleHTTPServer 8000

2. Now run it

		$ totally run
		...
		--- Started. Run totally logs to watch the startup process ---


	That will build a Docker image, and then run a new container with it. Repeat as many times as you like.

3. To get to your app, you might want to use a tunnel

		$ totally tunnel
		Tunneling localhost:12000 => my-super-docker-fragalistic => 172.17.0.2:8000. Got HTTP? http://localhost:12000/
		Press ^C to close tunnel

	At that point, you can point your browser at the tunnel URL displayed, and away you go!


Contributing
------------

Please fork the project, have a play with your changes, and get in touch with me, or send me a pull request! Easy.

![Circle CI build status](https://circleci.com/gh/pokle/totally/tree/master.png?circle-token=aaebe5e4a9e39b0e2000d5515128ce8dffba31a3)

[![Build Status](https://travis-ci.org/pokle/totally.svg?branch=master)](https://travis-ci.org/pokle/totally)



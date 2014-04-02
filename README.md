Totally
=======

Totally supports a continuous delivery workflow. 

It's opinionated software:

- Software that is continuously delivered is of higher quality.
- Rapid feedback of your changes is paramount.
- Repeatable deployments to all environments builds confidence.
- You're not done till your users have seen your work.
- Developing several modular microservices is superior to building a monolith.
- Rapid change is to be embraced.

It targets applications that will be delivered as Docker images. So it's suited to developing server side software - such as web applications, microservices, etc.

A tour of the workflow
----------------------
Say you work for a microcorp, and you've decided to write a new microservice to calculate the price of your widgets. The first thing you would do is create a new cookie-cutter project and get it deployed to a staging environment that is accessible to the consumers of its API.

	$ totally new microcorp/microservice whats-the-price
	$ cd whats-the-price
	$ totally run
	...
	Running at http://whats-the-price.staging/

That would create a new project using your company's microservice template, and get it running in a staging environment - in no more than 30 seconds.

And then you would lean over your cubicle wall, and say:

_You: Hey Bob, you know you were asking me how to work out the price of widgets? Go check out this API I built for you at http://whats-the-price.staging/_

_Bob: Ummm... So like you said earlier, I should be able to query something like http://whats-the-price.staging/price?product=superior&quantity=64?_

_You: Yeah, give me a minute, I'll add that in._

And then you open up the right file, and add an HTTP GET route for /price, returning a fixed price of $64, and then:

	$ totally run
	...
	Running at http://whats-the-price.staging/

_You: Try now Bob._

_Bob: Yes, that works for me. Can it handle a 20% discount for my big customer with say code=BIG?_

_You: Give me a minute._

So you get the picture. Totally does the plumbing using Docker to support a rapid development workflow where you want to get your work running in a production like environment rapidly. 


Pre-requisites
--------------
A host running Docker that you can ssh to without having to type in a password (with your key set up). Totally will ssh to the box, and expect to be able to connect to Docker on it.

	echo DOCKER_SSH_HOST=my-super-docker-fragalistic > ~/.totally

If you want to specify ssh ports, users, keys, etc., do it in your ~/.ssh/config file. Here's how I connect to my CoreOS Vagrant VM on my laptop:

	Host my-super-docker-fragalistic
		User core
		IdentityFile ~/.ssh/coreos_insecure_ssh_key
		HostName 192.168.67.144


Install
-------
On Mac OS X

	brew tap pokle/docker
	brew install totally	

On other Unix like systems, you need to simply install the totally script in somewhere in your $PATH such as /usr/local/bin


Contributing
------------

Please fork the project, have a play with your changes, and get in touch with me, or send me a pull request! Easy.

![Circle CI build status](https://circleci.com/gh/pokle/totally/tree/master.png?circle-token=aaebe5e4a9e39b0e2000d5515128ce8dffba31a3)

[![Build Status](https://travis-ci.org/pokle/totally.svg?branch=master)](https://travis-ci.org/pokle/totally)



0.6.0 2014-05-27
----------------
- build and run are split out again

0.5.0 2014-04-10
----------------
- Terminal colours! Much better visibility
- You can now run 'totally docker ...' outside of a project
- Added 'version' command
- Added PRE_BUILD_CMDS config so you can run commands before totally builds an image
- renamed interactive to run, and the old run becomes daemon
- Removed ps and inspect commands because they weren't used much

0.4.0 2014-04-07
----------------
- Support plugins

0.3.0 2014-04-02
----------------
- Dockerfiles are now supported in sub directories.
- 'totally init' now picks the first Dockerfile it finds.
- We now have templates
	- Example: totally new decoupled/microservice fluffy-cats

0.2.0 2014-04-01
----------------
- Enhancements
	- You can now practice deployment first development!

			mkdir my-project
			cd my-project
			totally init run

		And iterate!
	- You can now pass arguments to some commands like:

			totally inspect --format '{{.NetworkSettings.IPAddress}}'
	- Added new 'interactive' command that makes it easier to poke around your machine

			$ totally interactive bash
			# echo $BASH_VERSION
			4.1.2(1)-release
- Bug fixes
	- Reduce ssh noise #8 by not sending the script via stdin
	- tunnel now has better feedback if there are errors with the container

0.1.0 2014-03-30
----------------
- First release through HomeBrew

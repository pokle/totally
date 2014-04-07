Writing Totally commands
------------------------

When you run 'totally foo 1 2 3', totally calls a function called cmd_foo, and calls it passing the rest of the arguments on the command line. 

Also available are some standard configuration variables such as:

	NAME 		This project's name
	IMAGE		This project's image name
	CONTAINER	This project's container name

To see a full list, run 'totally config' in a project directory.

And that's it!

Exiting commands
----------------
If your command suffers an error, please return/exit with a non-zero error code after printing sufficient error messages.

If your command takes arguments, please make sure you exit your function with an 'exit'. Otherwise totally will try to run your arguments as commands!

Installing commands
-------------------
- You can place project specific commands in the .totally file in your project. 
- Global commands can be placed in $HOME/.totally
- If you want to contribute a new command to the totally project, place it in the src/commands directory. Don't forget to edit src/commands/help.sh

Development
-----------
During development, you just need src/totally in your $PATH. Or even symlink it from /usr/local/bin. totally will automatically source the commands in the src/commands directory.
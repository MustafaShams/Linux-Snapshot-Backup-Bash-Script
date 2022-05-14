# Linux Snapshot Backup Bash Script
The snapshot backup system allows the user to create backups on command they want to.  
It gives the user the ability to schedule routine backups for the system. 
A Snapshot backup means that we will be capturing the state of the entire file system at the moment the command is given. 
The shell scripts take in command line arguments that allow the user to create backups whenever they want, with custom names. 
The user can also specify in the command line argument if they want to schedule backups and how often these backups happen. 
Crontab will be used to schedule the backup scripts. 
The backups will all be stored in a special folder accessible by the root and administrators.

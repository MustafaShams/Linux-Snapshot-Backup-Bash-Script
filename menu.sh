#!/bin/bash

intro='[INSERT PROJECT NAME HERE] is a secure and efficient way to execute and automate filesystem backups via the sonsole.'

echo
echo $intro
echo "======== MENU ========"
echo
echo "Please select an option:"
echo
options=("1. Backup directories to the host machine" "2. Restore a backup" "3. Exit")
select x in "${options[@]}"
do
	case $x in
		"1. Backup directories to the host machine")
		    	#Run script 1 here
			echo
		    	echo "You chose to backup directories."
		    	echo
			./share/CS183_FinalProject/backup.sh
		    	;;
		"2. Restore a backup")
		    	#Run script 2 here
			echo
		    	echo "You chose to restore a backup."
                    	echo
			./share/CS183_FinalProject/restore.sh
		    	;;
		"3. Exit")
			echo
		        echo "Goodbye"
			break;
			;;
		*) echo; echo "ERROR: Invalid input. Please try again.";;
	esac
	echo "======================"
done

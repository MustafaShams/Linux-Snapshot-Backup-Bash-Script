#!/bin/bash

intro='[INSERT PROJECT NAME HERE] is a secure and efficient way to execute and automate filesystem backups via the console.'

echo
echo $intro
echo "======== MENU ========"
echo 
echo "Please select an option:\n"
echo
options=("1. Backup directories to the host machine" "2. Snapshot backup of machine instance" "3. Exit")
select x in "${options[@]}"
do
	case $x in
		"1. Backup directories to the host machine")
			#Run the script 1 here
			echo "You chose to backup directories to the host machine."
			;;
		"2. Snapshot backup of machine instance")
			#Run script 2 here
			echo "You chose to snapshot backup the machine."
			;;
		"3. Exit")
			echo "Goodbye"
			break;
			;;
		*) echo "ERROR: Invalid input. Please try again.";;
	esac
	echo "======================"
done

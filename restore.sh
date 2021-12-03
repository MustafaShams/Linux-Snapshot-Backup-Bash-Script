#!/bin/bash
cd /

echo
echo "======== RESTORE ========"

if [ "$(ls -A /mnt/backup)" ];
then
	
	echo "Select a backup file to restore: "
	echo

	#Clears index.txt
	>  /share/CS183_FinalProject/index.txt
	#Outputs /mnt/backup directory to index.txt
	index="/share/CS183_FinalProject/index.txt"
	ls -A -1 /mnt/backup > $index
	
	#Print list
	cat $index
	echo
	
else
	echo "There are no backup files."
	exit -1;
fi

#Checks if it exists

	read -p "Enter here: " selection
	echo;
	
	if grep -q $selection "$index"
	then
		#Restores the directory
			if sudo tar -xzvf /mnt/backup/$selection;
			then
				tput setaf 2; echo; echo "Complete! $selection has been restored."; tput setaf 7;
			else
				echo; echo "ERROR: Failed to restore $selection.";
			fi
	else	
			echo "ERROR: Backup file does not exist."
	
	fi
	
#Reset
> /share/CS183_FinalProject/index.txt

cd /share/CS183_FinalProject


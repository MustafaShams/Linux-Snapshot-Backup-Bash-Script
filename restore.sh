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

	#Loops through directory and writes paths to index.txt
	count=0
	directory="/mnt/backup/*"

	for line in $directory
	do
		count=$(( count + 1 ))
		echo "[$count] $line" > /share/CS183_FinalProject/index.txt 
	done

	#Print list
	cat /share/CS183_FinalProject/index.txt
	echo

	echo "Selection: "; read selection; echo;

	#Checks if it's a number
	if ! [[ "$selection" =~ ^[0-9]+$ ]];
	then
		echo "ERROR: Invalid input"
	else	
		#Checks if the index exists
		if [[ selection -gt count ]]
		then
			echo "ERROR: No file exists at index: $selection"
		else
			#Separates path from index
			path=$(grep '[$selection]' /share/CS183_FinalProject/index.txt | cut -d ' ' -f 2)

			if sudo tar -xzvf $path;
			then
				tput setaf 2; echo; echo "Complete! $path has been restored."; tput setaf 7;
			else
				echo; echo "ERROR: Failed to restore $path.";
			fi
		
		fi
	fi
else
	echo "There are no backup files."
fi

#Reset
count=0
> /share/CS183_FinalProject/index.txt

cd /share/CS183_FinalProject

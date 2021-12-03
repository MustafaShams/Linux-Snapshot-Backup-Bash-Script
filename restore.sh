#!/bin/bash

cd /

echo
echo "======== RESTORE ========"
echo "Select a backup file to restore: "
echo

#Clears index.txt
> index.txt

#Loops through directory and writes paths to index.txt
count=0
directory="/mnt/backup/*"

for line in $directory
do
	count=$(( count + 1 ))
	echo "[$count] $line" > index.txt 
done

#Print list
cat index.txt
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
		path=$(grep '[$selection]' index.txt | cut -d ' ' -f 2)

		if sudo tar -xzvf $path;
		then
			tput setaf 2; echo; echo "Complete! $path has been restored."; tput setaf 7;
		else
			echo; echo "ERROR: Failed to restore $path.";
		fi
		
	fi
fi
echo "========================="

cd /share/CS183_FinalProject

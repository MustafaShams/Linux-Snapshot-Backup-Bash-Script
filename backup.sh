#!/bin/bash

#for test only
default_backups="/home/bmcgh001"

real_default_backups="/home /etc /root /var /usr/local /srv /opt"

echo
echo "======== BACKUP ========"
echo

day=$(date)
day="${day// /_}"

archive="$(hostname -s)-$day.tgz"

echo "Do you want to create a custom backup filename? [y/N]: "
read namechoice
echo

if [ "$namechoice" = "y" ];
then
	echo "Enter custom backup filename: "
	read custom_name
	archive="$custom_name.tgz"
fi

echo
echo "Do you want to schedule routine backups? [y/N]: "
read cronchoice

if [ "$cronchoice" = "y" ];
then
	echo "enter the frequency/time to run your script in the format: * * * * *" 
	read cronedit
	cmd=" bash /root/CS183_FinalProject/backup.sh" 
	crontab -l > mycron
	echo "$cronedit$cmd" >> mycron
	crontab mycron
	rm -f mycron
fi

echo
echo "Insert custom directories to backup or press ENTER: "
read user_backups
echo



backups="$default_backups $user_backups"

echo $archive >> /share/CS183_FinalProject/test.txt

if tar czf /mnt/backup/$archive $backups;
then
	tput setaf 2; echo; "Complete! Files were backed up."; tput setaf 7;
fi





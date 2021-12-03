#!/bin/bash

#for test only
default_backups="/home/ksham004 /root/CS183/lab2"

real_default_backups="/home /etc /root /var /usr/local /srv /opt"

day=$(date)
day="${day// /_}"

archive="$(hostname -s)-$day.tgz"




echo "Do you want to create a custom backup filename? [y/N]: "
read namechoice

if [ "$namechoice" = "y" ];
then
	echo "Enter custom backup filename"
	read custom_name
	archive="$custom_name.tgz"
fi

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

echo "Do you want to add custom directories to backup? [y/N]: "
read dirchoice

if [ "$dirchoice" = "y" ];
then
	echo "Enter custom directories to backup or press ENTER: "
	read user_backups
fi



backups="$default_backups $user_backups"

echo $archive >> /root/CS183_FinalProject/test.txt

tar czf /mnt/backup/$archive $backups

tput setaf 2; echo "BACKUP DONE"; tput setaf 7;

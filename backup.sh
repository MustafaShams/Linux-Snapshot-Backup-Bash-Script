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

#echo "Enter custom backup filename"
#read custom_name

echo "Do you want to schedule routine backups? [y/N]: "
read cronchoice

if [ "$cronchoice" = "y" ];
then
	crontab -l > mycron
	echo "*/2 * * * * bash /share/CS183_FinalProject/backup.sh" >> mycron
	crontab mycron
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
#cp /mnt/backup/$archive /root/CS183_FinalProject/$archive




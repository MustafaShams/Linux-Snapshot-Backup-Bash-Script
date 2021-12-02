#!/bin/bash

#for test only
default_backups="/home/ksham004 /root/CS183/lab2 "

real_default_backups="/home /etc /root /var /usr/local /srv /opt"

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
	echo "*/2 * * * * bash /root/CS183_FinalProject/backup.sh" >> mycron
	crontab mycron
fi

echo "Insert custom directories to backup or press ENTER: "
read user_backups

backups="$default_backups $user_backups"

echo $archive >> /root/CS183_FinalProject/test.txt

tar czf /mnt/backup/$archive $backups

#cp /mnt/backup/$archive /root/CS183_FinalProject/$archive

tput setaf 2; echo "BACKUP DONE"; tput setaf 7;

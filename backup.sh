#!/bin/bash

default_backups="/home/ksham004 /root/CS183/lab2 "

day=$(date)
day="${day// /_}"

archive="$(hostname -s)-$day.tgz"

echo "Insert custom directories to backup or press ENTER: "
read user_backups

echo $user_backups > user_backups.txt

backups="$default_backups $user_backups"

echo $archive >> /root/CS183_FinalProject/test.txt

tar czf /mnt/backup/$archive $backups

#cp /mnt/backup/$archive /root/CS183_FinalProject/$archive

tput setaf 2; echo "BACKUP DONE"; tput setaf 7;

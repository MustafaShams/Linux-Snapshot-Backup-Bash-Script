#!/bin/bash

backups=("/home/ksham004" "/root/CS183/lab2")

day=$(date)
day="${day// /_}"

archive="$(hostname -s)-$day.tgz"

read userbackups

echo $userbackups > custombackups.txt

backups+=( $userbackups )

for i in ${!backups[@]}; do

	echo ${backups[$i]}
done


echo $archive >> /root/CS183_FinalProject/test.txt

#tar czf /mnt/backup/$archive $backups

#cp /mnt/backup/$archive /root/CS183_FinalProject/$archive

#echo backup done

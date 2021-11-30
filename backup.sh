#!/bin/bash

backups="/home/ksham004 /root/CS183/lab2"

day=$(date)
day="${day// /_}"

archive="$(hostname -s)-$day.tgz"

echo $archive

tar czf /mnt/backup/$archive $backups

cp /mnt/backup/$archive /root/CS183/proj_test/$archive

echo done

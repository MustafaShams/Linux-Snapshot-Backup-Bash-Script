#!/bin/bash

cd /

ls -A /mnt/backup > /root/CS183_FinalProject/index.txt
echo
echo "Backup files available to restore: "
echo

cat /root/CS183_FinalProject/index.txt
rm -f /root/CS183_FinalProject/index.txt
echo

echo "Enter backup file to restore: "
read backupname

tar -xzvf /mnt/backup/$backupname 

tput setaf 2; echo "RESTORE DONE"; tput setaf 7;

cd /root/CS183_FinalProject

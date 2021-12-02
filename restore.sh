#!/bin/bash

cd /

echo "Enter backup file to restore: "
read backupname

sudo tar -xzvf /mnt/backup/$backupname 

tput setaf 2; echo "RESTORE DONE"; tput setaf 7;

cd /root/CS183_FinalProject

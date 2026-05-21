#!/bin/bash

#==========================================================#
: '
* * * * * command
- - - - -
| | | | |
| | | | day of week
| | | month
| | day
| hour
minute

#####Cron Job Basics#####

1) Cron service:   cron
                   crond

2) Open cron: crontab -e

3) View cron:  crontab -l
'
#========================================================#

#------------ Every Minute Script ------------#

#date >> /mnt/d/bash_script/gitcentral/Bash_script/time.log

#------------ Daily Backup Automation ------------#

BACKUP_NAME="backup_$(date +%F).tar.gz"

# jaha backup save karna hai aur jis folder ka backup lena hai
DEST_FOLDER="/mnt/d/bash_script/gitcentral/Bash_script/Backups"
SRC_FOLDER="/mnt/d/bash_script/gitcentral/bash2"

#Backup folder agar nahi hai tu banao
mkdir -p "$DEST_FOLDER"

# Tar command se backup create karo
tar -czf "$DEST_FOLDER/$BACKUP_NAME" "$SRC_FOLDER"
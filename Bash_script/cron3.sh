#!/bin/bash
#------------ Website Monitoring Automation ------------#
: '
URL="https://google.com"
LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/website_status"
EMAIL="mansoorimohdkaif786@gmail.com"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "URL")

if [ "$STATUS_CODE" -ne 200 ]; then
    TIMESTAMP=$(date "+%Y-%m-%d %H-%M-%S")
    MESSAGE="ALERT: Website $URL is DOWN! Status Code: $STATUS_CODE"
    
    echo "$TIMESTAMP | CPU: $CPU_USAGE | $RAM_USAGE | $DISK_USAGE" >> "$LOG_FILE"
    echo "$MESSAGE at $TIMESTAMP. Please check immediately." | mail -s "WEBSITE DOWN ALERT!" "$EMAIL"
    
fi
'

#------------ Auto Restart Service ------------#
: '
# Service ka naam jisse monitor karna hai
SERVICE="nginx"
LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/nginx_restart.log"

# Check karna ki service active hai ya nahi
if ! systemctl is-active --quiet "$SERVICE"; then
    TIMESTAMP=$(date "+%Y-%m-%d %H-%M-%S")

    echo "$TIMESTAMP | ALERT: $SERVICE down mila. Restart karne ki koshish kar raha hai..." >> "$LOG_FILE"
    sudo systemctl restart "$SERVICE"

    if systemctl is-active --quiet "SERVICE"; then
        echo "TIMESTAMP | SUCCESS: $SERVICE successfully restart ho gaya." >> "$LOG_FILE"
    else
        echo "$TIMESTAMP | ERROR: $SERVICE restart nahi ho paya! Alag se check karein." >> "$LOG_FILE"
    fi
fi
'
#------------ Cron + Database Backup ------------#
: '
# Step 1: Pehle mysqldump ka basic command samajhye
MySQL ka backup lene ka standard command aisa hota hai:

Bash
mysqldump -u [username] -p[password] [database_name] > backup.sql
Dhyan dein: -p aur password ke beech me koi space (khali jagah) nahi hoti.
'

: '
# 1. Configuration
DB_USER="root"
DB_PASS="Aapka password"   # <--- Apna real password likhein
DB_NAME="my_database"      # <--- Apne database ka naam likhein
BACKUP_DIR="/mnt/d/bash_script/gitcentral/Bash_script/db_backups"

# 2. Date format filename ke liye (e.g., my_database_2026-05-24_12-17)
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql"

# 3. Agar backup folder nahi bana hai to use create karo
mkdir -p "$BACKUP_DIR"

# 4. Mysqldump command chalao
# 2> /dev/null lagane se terminal par password ki warning nahi dikhti
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"2> /dev/null

# 5. Check karo backup sahi se hua ya nahi
if [ $? -eq 0 ]; then
    echo "$(date "+%Y-%m-%d %H:%M:%S") | SUCCESS: Database backup creted successfully at $BACKUP_FILE" >> "$BACKUP_DIR/backup_status.log"
else
    ehco "$(date "+%Y-%m-%d %H:%M:%S") | ERROR: Database backup FAILED!" >> "$BACKUP_DIR/backup_status.log"
fi
'
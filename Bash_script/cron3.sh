#!/bin/bash
#------------ Website Monitoring Automation ------------#

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

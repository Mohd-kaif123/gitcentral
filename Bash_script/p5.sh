#------------Log cleaner-------------#
#!/bin/bash
: '
log_file="/mnt/d/bash_script/gitcentral/Bash_script/"
find "$log_file" -name "*.log" -type f -mtime +7 -exec rm -f {} \; '

#------------word counter-------------#
# wc p4.sh

#------------#LEVEL-4#-------------#
# Disk Usage monitor
: '
USAGE=$( df -h | grep '/$' | awk '{print $5}' | tr -d '%')
if [ "$USAGE" -ge 5 ]; then
    echo "disk in danger"
else
    echo "disk is good"
fi '


#------------#LEVEL-4#-------------#

USAGE=$(free -m | grep 'Mem:' | awk '{print int($3/$2 * 100)}' )
if [ "$USAGE" -lt 100 ]; then
    echo "Disk in Danger: $USAGE"
else
    echo "Disk is good: $USAGE"
fi
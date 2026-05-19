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

#USAGE=$(free -m | grep 'Mem:' | awk '{print int($3/$2 * 100)}' )
: 'if [ "$USAGE" -lt 100 ]; then
    echo "Disk in Danger: $USAGE"
else
    echo "Disk is good: $USAGE"
fi
'

#------------#LEVEL-4#-------------#
# Service checker:-

echo "Checking Nginx status..."

if ! command -v nginx &> /dev/null   # command -v (ye linux ka ek tool hai jo check karta hai ki nginx naam ka cmd ya software system me available hai ki nahi)
then                                # command -v ( ye jab bhi chalta hai tu trminal per kuch text output deta hai tu ham usse /dev/null me dal dete hai)
    echo "Nginx installed nahi hai. Pahale install kar rahe hai."
    sudo apt update -y
    sudo apt install nginx -y

    # $? ---> ye check karta hai ki last wali cmd safely chali ki nahi (mean hamne install kiya tha tu safey hua)
    # $? --> agar ye bina arror ke hua hai tu 0 hona chaiye isliye waha 0 likhe hai ham
    if [ $? -eq 0 ]; then
        echo "Nginx successfully install ho gya hai!"
    else
        echo "Error: Nginx install nahi ho paya. Script ko sudo se chalao."
        exit 1   # agar install nahi hua last cmd sahi nahi chala tu exit 1(mean script terminate or band kar deta hai)
    fi
else
    echo "Nginx pehle se installed hai."
fi

# check if Nginx is reunning
if systemctl is-active --quiet nginx # --quiet: Jaise upar /dev/null kiya tha, waise hi yeh flag systemctl ke output (active/inactive text) ko chhupa deta hai
then
    echo "Nginx already RUNNING hai."
else
    echo "Nginx RUNNING nahi hai! Automatic start kar rahe hai.
    sudo systemctl start nginx

       # Ek sur baar check karne ke liye start hua ya nahi
    if systemctl is-active --quiet nginx
    then
        echo "Nginx successfully START ho gaya hai!"
    else
        echo "Error: Nginx ko start nahi kiya ja saka
    fi
fi
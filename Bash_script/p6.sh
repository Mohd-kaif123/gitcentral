#!/bin/bash
: '
ping -c 1 google.com &> /dev/null

if [ $? -eq 0 ]; then
    echo "Website is Up"
else
    echo "website is Down!"
fi
'

#------------#LEVEL-5#-------------#

while true
do 
    echo "-----------------------------"
    echo "      MAIN MENU              "
    echo "1. Check RAM"
    echo "2. Check Disk"
    echo "3. Check CPU"
    echo "5. Exit"
    echo "------------------------------"

    read -p "Chose option [1-4]: " choice

# case $choice in: Yeh if-else ka ek clean alternative hai.
# Yeh check karta hai ki $choice variable ki value kya hai.

    case $choice in
        1)
            echo "------ RAM USAGE REPORT --------"
            free -m
            ;;
        2)
            echo "------- DISK USAGE REPORT ---------"
            df -h
            ;;
        3) 
            echo "-------- CPU USAGE REPORT ----------"
            top -bn1 | head -n 5
            ;;
        4)
            echo "Script se bahar nikal rahe hai... Bye!"
            exit 0
            ;;

        *) 
            echo "Galat option! please 1 se 4 ke bich me chne"
    esac

    echo ""
done
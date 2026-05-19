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
: '
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
'

#------------#LEVEL-5#-------------#

while true
do
    echo "=============================="
    echo "    USER MANAGEMENT           "
    echo "=============================="
    echo "1. Create a User"
    echo "2. Set/change Password"
    echo "3. Delete a User"
    echo "4. Exit"

    read -p "Choose option [1-4]: " choice

    case $choice in
        1)
            echo "------Create user --------"
            read -p "User Name: " username
            sudo useradd -m $username
            echo "User '$username' successfully created"
            ;;
        2)
            echo "--------- SET PASSWORD ----------"
            read -p "kiske liye password set karna hai? Username: " username
            sudo passwd $username
            ;;
        3)
            echo "------------ DELETE USER ------------"
            read -p "kaunsa user delete karna hai? Username:" username
            sudo userdel -r $username
            ;;
        4) 
            echo "Exiting.... Bye!"
            exit 0
            ;;
        *)
            echo "Invalid option! 1-4 ke beech hi select karo."
            ;;
    esac
    echo ""
done
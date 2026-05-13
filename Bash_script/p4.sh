#!/bin/bash
correct_pass="linux123"
read -p "Enter password:" user_input
while [ "$user_input != $correct_pass"]
do 
    echo "password is wrong! Try Again"
    read -p "Enter Password again:" user_inpput
done

echo "Access Granted! Welcome to the system."

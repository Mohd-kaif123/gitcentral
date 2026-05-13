#!/bin/bash
echo "Hello kaif"
current_date=$(date)
echo "Today Date: $current_date"
current_user=$(whoami)
echo "Current Loged User: $current_user"

echo "###################################################"

name="kaif"
age="22"
city="Bhiwandi"
echo "My name is $name "
echo "I am $age years old"
echo "I line in $city"

echo "#####################################################"

echo "What is your name?"
read name
echo "Hello! $name"
echo "Tell me about your favourite language!"
read language
echo "$language it is a good!"
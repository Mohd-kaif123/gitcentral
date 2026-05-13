#!/bin/bash

: '
#-------------Basic Calculator---------------#
# -p use karke ek hi line me duno kaam hojaega echo wala bhi aur read wala bhi
read -p "Enter first number:" num1
read -p "Enter second Number:" num2

sum=$((num1 + num2))   #$(( )): Iska use basic math (+, -, *) ke liye hota hai. Ye sirf integers (round numbers) handle karta hai.
sub=$((num1 - num2))
mul=$((num1 * num2))

div=$(echo "scale=2; $num1 / $num2" | bc)  # bc: Division me agar aapko points (decimal) me answer chahiye, toh bc command use karni padti hai.
                                           # scale=2 ka matlab hai point ke baad 2 numbers tak answer dikhana.
echo "--------------Results----------------"
echo "Addition: $sum"
echo "Subtraction: $sub"
echo "Multiplication: $mul"
echo "Division : $div"
'
: '
#----------Argument pass-----------#
echo "Name:"$1
echo "Age:"$2
echo "Skill:"$3
'
: '
#---------System Variables------------#
echo "Home:"$HOME
echo "User:"$USER
echo "Current directory:"$PWD
echo "shell:"$SHELL
echo $?
echo $$
'

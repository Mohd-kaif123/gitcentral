#!/bin/bash
echo "Enter a number"
read num

if [ $num -gt 10 ]; then
    echo "the number is greater than 10"
else
    echo "The no. is less then or equal to 10"
fi
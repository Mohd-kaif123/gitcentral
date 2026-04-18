#!/bin/bash
email="kaifmansoori12@gmail.com"
pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

if [[ $email =~ $pattern ]]; then
    echo "Valid email address";
else 
    echo "Invalid email address";
fi
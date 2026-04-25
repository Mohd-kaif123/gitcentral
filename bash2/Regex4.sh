#!/bin/bash

password="Kaif@3211"
pattern="^[a-zA-Z0-9._%-]";

if [[ $password =~ $pattern ]]; then
    echo "pass is valid"
else
    echo "pass is not valid"
fi
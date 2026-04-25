#!/bin/bash

input="+919746579748"

if [[ $input =~ ^\+91[6-9][0-9]{9}$ ]]; then
    echo "mob is valid";
else
    echo "mob is not valid";
fi
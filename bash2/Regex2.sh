#!/bin/bash

input="9147579748"

if [[ $input =~ ^[0-9]{10}$ ]]; then
    echo "Input is a Mobile Number";
else
    echo "Input is not a mobile number";
fi
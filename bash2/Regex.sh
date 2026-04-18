#!/bin/bash

input="123456"

if [[ $input =~ ^[0-9]+$ ]]; then
    echo "Input is No.";
else
    echo "Input is not No.";
fi
#!/bin/bash

# waiting for service to start

SERVICE="nginx"

echo "waiting for $SERVICE to start..."
until systemctl is-active --quiet $SERVICE; do
    echo "$SERCVICE is not achive. waiting..."
    sleep 1
done
echo "$SERVICE is active."
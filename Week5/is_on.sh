#!/bin/bash

# Check if host argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 host"
  exit 1
fi

# Ping the host once
ping -c 1 -W 1 "$1" > /dev/null 2>&1

# Check the return value of the ping command
if [ $? -eq 0 ]; then
  echo "OK"
else
  echo "Host is not reachable"
fi

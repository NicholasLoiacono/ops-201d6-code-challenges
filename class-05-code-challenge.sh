#!/bin/bash

# Get a list of running processes
processes=$(ps -eo pid,user,%cpu,%mem,cmd --sort=-%cpu | awk 'NR>1')

# Display the list of processes
echo "PID   USER   %CPU   %MEM   COMMAND"
echo "$processes"

# Ask the user for the PID of a process
read -p "Enter the PID of the process to kill: " pid

# Check if the process with the provided PID exists
if ! ps -p "$pid" > /dev/null 2>&1; then
    echo "ERROR: No process found with PID $pid."
    exit 1
fi

# Kill the process with the provided PID
kill "$pid"

# Check if the process was successfully killed
if ! ps -p "$pid" > /dev/null 2>&1; then
    echo "Success: The process with PID $pid was killed."
    exit 0
else
    echo "ERROR: Failed to kill the process with PID $pid."
    exit 1
fi
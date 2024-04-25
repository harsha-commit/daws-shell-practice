#!/bin/bash

# Clear the screen
clear

# Get current directory's Absolute path
# Alternatively you can use $PWD
DIRECTORY_PATH=$(pwd)

# Print the current directory
echo "Current Directory: $DIRECTORY_PATH"

# Create 002-practice directory
mkdir 002-practice

# Change directory to 002-practice using relative path
cd ./002-practice

# Move to previous directory
cd ..

# Change directory to 002-practice using absolute path
cd ${DIRECTORY_PATH}/002-practice

# Create some files
touch created-by-touch
echo "hello" > created-by-echo

# List files in long format, old to new order with hidden files
ls -ltra

# Delete all files
rm created-by-touch
rm created-by-echo

# Move to previous directory
cd ..

# Delete 002-practice directory
rm -r 002-practice

# Delete 002-practice directory
ls
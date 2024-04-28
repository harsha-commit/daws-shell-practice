#!/bin/bash

# Download data from URL
curl -O "https://raw.githubusercontent.com/harsha-commit/daws-shell-practice/main/utilities/data.csv?token=GHSAT0AAAAAACOKJAZFF4BK32PCHS7SAMUYZRKCX3A"

# Create prod and test directories
mkdir prod test

# Rename data.csv to users.csv
mv data.csv users.csv

# Make a copy of users.csv and store in /tmp
cp users.csv /tmp/

# Move users.csv to test directory
mv data.csv test/

# Copy test to prod directory
cp -r test/ prod/

# Move to /test
cd /test

# Open users.csv in READ-ONLY mode
view users.csv

# Print last 10 lines of users.csv
tail -n 10 users.csv

# Check if Abby is present in the users.csv
grep "Abby" users.csv

# Check if Mario is present in the users.csv (include lowercase)
cat users.csv | grep -i "Mario"

# Print email address of Mario (before @)
cat users.csv | grep -i "Mario" -f "," '{print $4F}' | cut -d "@" -f 1

# Print all IP Addresses in the users.csv (don't use numbered fragment)
grep -f "," '{print $NF}' users.csv

# Open users.csv in vim editor
vim users.csv

## ESCAPE MODE

"
# Set row numbers
set nu

# Search for Benoit from bottom
:?Benoit

# Search for Hal from top
:/Hal

# Remove highlight
:noh

# Replace a word in line where cursor is
:s/Hal/HAL

# Replace a word in all lines, but only first occurence
:%s/Male/male

# Replace a word in specific line, and all occurences (global)
:8s/mario/Mario/g

# Replace a word in all lines, all occurences and ignore case
:%s/FEMALE/female/gi

# Remove row numbers
set nonu

# Delete everything
%d
"

# Change Permission of users.csv (Others get all access)
chmod ugo+rwx users.csv

# Change Permission of users.csv (Only user get all access)
chmod 700 users.csv
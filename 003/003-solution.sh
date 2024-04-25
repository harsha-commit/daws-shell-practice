#!/bin/bash

# Download data from URL
curl -O "https://raw.githubusercontent.com/harsha-commit/daws-shell-practice/main/utilities/data.csv?token=GHSAT0AAAAAACOKJAZFF4BK32PCHS7SAMUYZRKCX3A"

# Rename the downloaded file to users.csv
mv data.csv users.csv

# Show last five users from users.csv
tail -n 5 users.csv

# Create a test and prod directory
mkdir test

# Copy users.csv to test, but rename as test-users.csv
cp ./users.csv ./test/test-users.csv

# Show the contents of, in read-only mode
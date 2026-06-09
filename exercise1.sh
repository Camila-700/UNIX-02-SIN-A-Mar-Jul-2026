#!/bin/bash

# Store the first argument
FIRST_NAME="${1}"

# Store the second argument
LAST_NAME="${2}"

# Create the output file
touch output.txt

# Write the current date
date +"%d-%m-%Y" > output.txt

# Add the full name
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt

# Create a backup copy
cp output.txt backup.txt

# Show the file content
cat output.txt
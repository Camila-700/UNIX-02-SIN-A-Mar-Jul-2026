#!/bin/bash
# Run this script using Bash

FILE="output.txt" 
# Set the file name to check

touch "${FILE}" 
# Create the file if it does not exist

until [[ -s "${FILE}" ]]; do 
# Loop until the file has content
  echo "${FILE} is empty..." 
# Show that the file is still empty
  echo "Checking again in 2 seconds..." 
# Show retry message
  sleep 2 
# Wait 2 seconds before checking again
done 
# End the loop

echo "${FILE} appears to have some content in it!" 
# Show success message
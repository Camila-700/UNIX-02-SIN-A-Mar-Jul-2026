#!/bin/bash
# Run this script using Bash

SIGNAL_TO_STOP_FILE="stoploop" 
# Set the stop signal file name

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do 
# Loop while the file does not exist
  echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..." 
# Show file not found message
  echo "Checking again in 2 seconds..." 
# Show retry message
  sleep 2 
# Wait 2 seconds before checking again
done 
# End the loop

echo "File was found! Exiting..." 
# Show exit message

bash while_loop.sh
# Run the while loop script
touch stoploop
# Create the stop file to end the loop
#!/bin/bash
# Run this script using Bash

for file in example_file*; do 
# Loop through files starting with example_file
  if [[ "${file}" == "example_file1" ]]; then 
# Check if this is the first file
    echo "Skipping the first file" 
# Show skip message
    continue 
# Skip to the next file
  fi 
# End the if statement

  echo "${RANDOM}" > "${file}" 
# Write a random number to the file
done 
# End the loop
#!/bin/bash
# Use the Bash shell to execute this script.

NAME="${1}" # Store the first command-line argument as the name.
DOMAIN="${2}" # Store the second command-line argument as the domain.
OUTPUT_FILE="results.csv" # Define the name of the output CSV file.

# Check whether the name or domain argument is missing.
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then # Start a condition to verify that both arguments were provided.
  echo "You must provide two arguments to this script." # Print an error message if the required arguments are missing.
  echo "Example: ${0} mysite nostarch.com" # Show an example of how to run the script correctly.
  exit 1 # Stop the script with an error status.
fi # End the argument validation condition.

echo "status,name,domain,timestamp" > ${OUTPUT_FILE} # Write the CSV header to the output file.

if ping -c 1 "${DOMAIN}" &> /dev/null; then # Send one ping request to the domain and check whether it succeeds.
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}" # Append a success result with the current date to the CSV file.
else # Run this block if the ping command fails.
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}" # Append a failure result with the current date to the CSV file.
fi # End the ping result condition.
```

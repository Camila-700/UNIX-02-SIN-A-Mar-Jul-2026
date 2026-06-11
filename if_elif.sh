#!/bin/bash
# Use Bash to run this script.

USER_INPUT="${1}"
# Store the first argument in a variable.

if [[ -z "${USER_INPUT}" ]]; then
# Check if the argument is empty.

  echo "You must provide an argument!"
  # Print an error message.

  exit 1
  # Stop the script with an error code.

fi
# End the empty argument check.

if [[ -f "${USER_INPUT}" ]]; then
# Check if the argument is a file.

  echo "${USER_INPUT} is a file."
  # Print that the argument is a file.

elif [[ -d "${USER_INPUT}" ]]; then
# Check if the argument is a directory.

  echo "${USER_INPUT} is a directory."
  # Print that the argument is a directory.

else
# Run this if it is not a file or directory.

  echo "${USER_INPUT} is not a file or a directory."
  # Print that the argument is neither.

fi
# End the file or directory check.
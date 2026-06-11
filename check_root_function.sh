#!/bin/bash

# Define a function named 'check_if_root'
check_if_root(){

  # Check if the Effective User ID (EUID) equals 0 (root)
  if [[ "${EUID}" -eq "0" ]]; then

    # Return success (0) if the user is root
    return 0

  # If the user ID is not 0
  else

    # Return failure (1) if the user is not root
    return 1

  fi
}

# Call the function and check its result
if check_if_root; then

  # Print a message if the function returned 0
  echo "User is root!"

# If the function returned 1
else

  # Print a message if the function failed
  echo "User is not root!"

fi
#!/bin/bash
set -x
bash --version
env
echo ${SHEL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}

man ls
# Opens the manual page for the ls command
ps -e -f
# Shows all running processes in full format
ps -ef
# Displays all active system processes with detailed information
df --human-readable
# Shows disk space usage in a human-readable format

bash -r blackhatbash1.sh
# Runs Bash in restricted mode with the script
bash -n blackhatbash.sh
# Checks the script for syntax errors without running it
bash -x blackhatbash.sh 
# Runs the script in debug mode showing executed commands
set +x
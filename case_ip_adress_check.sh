#!/bin/bash
# Run this script using Bash

IP_ADDRESS="${1}" 
# Store the first argument as the IP address

case ${IP_ADDRESS} in 
# Check which pattern the IP matches
  192.168.*) 
# Match IPs starting with 192.168.
    echo "Network is 192.168.x.x" 
# Show the 192.168 network message
    ;;
  10.0.*) 
# Match IPs starting with 10.0.
    echo "Network is 10.0.x.x" 
# Show the 10.0 network message
    ;;
  *) 
# Match anything else
    echo "Could not identify the network" 
# Show unknown network message
    ;;
esac 
# End the case statement

bash case_ip_adress_check.sh 192.168.1.10 
bash case_ip_adress_check.sh 10.0.0.5 
bash case_ip_adress_check.sh 8.8.8.8
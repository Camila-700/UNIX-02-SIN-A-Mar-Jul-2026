#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY
ps | grep -i tty
grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt

awk '{print $1}' log.txt
cat log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
awk '{print $1,$NF}' log.txt

# Create an empty file named example_csv.txt.
touch example_csv.txt

# Overwrite the file with the line "hola,Ash,chao".
echo "hola,Ash,chao" > example_csv.txt

# Overwrite the file with the line "hola,Pau,chao".
echo "hola,Pau,chao" > example_csv.txt

# Overwrite the file with the line "a,b,c".
echo "a,b,c" > example_csv.txt

awk -F',' '{print $1}' example_csv.txt

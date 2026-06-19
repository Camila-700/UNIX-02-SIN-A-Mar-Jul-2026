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

head log.txt 
awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt
awk '{print $7}'
grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt 
grep "Mozilla" log.txt 
grep "Godzilla" log.txt 
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt

sed '1d' newlog.txt
sed -i '1d' newlog.txt
diff log.txt newlog.txt 
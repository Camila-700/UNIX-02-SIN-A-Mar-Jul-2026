#!/bin/bash

top
#muestra en tiempo real los procesos y uso de CPU/memoria

top&
#intenta ejecutarlo en segundo plano

touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "EL comando lzl fallo"

echo "Hola Mundo" > output.txt
cat output.txt
echo "Chao mundo" > output.txt
cat output.txt
echo "Chao chao" >> output.txt
cat output.txt

ls -l / &> stdout_and_stderr.txt
ls -l / 1> stdout.txt 2>> stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt

lzl 2> error.txt
cat error.txt


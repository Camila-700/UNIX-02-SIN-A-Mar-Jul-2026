ls -a
#list all files, including hidden ones.
ls --all
#list all files, including hidden ones.
ls -l
#list files in long format with detailed information.
ls -l -a -h
#list all files (including hidden) in long format with human-readable sizes.
ls -lah
#same as above: list all files in long format with human-readable sizes.
mkdir -- -rf
#create a directory literally named ‘-rf’ (using -- to stop option parsing).
rm -rf
#recursively and forcefully delete files and directories.
rmdir -- -rf
#remove an empty directory named ‘-rf’ (using -- to stop option parsing).
ls --help
#display a quick help message for the ls command.
man ls 
# open the manual page for the ls command.
man git-clone 
/depth
#open the manual page for the git clone command.
#limit the clone to a specific number of commits (shallow clone).
touch script.sh
#create an empty file named script.sh.
chmod +x script.sh
#add execute permission to the file for all users.
chmod u+x script.sh
#add execute permission for the file owner.     
chmod o-r secreto.txt
#remove read permission from others.
chmod u+rw,go-rwx privado
#give owner read/write and remove all permissions from group and others.
sudo chmod +x init
#run chmod as superuser to add execute permission to init.
sudo echo "hola" > /etc/archivo_protegido
#attempt to write ‘hola’ to a protected file.
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#write ‘hola’ to a protected file using sudo (suppressing output).
echo "hola" | sudo tee /etc/archivo_protegido
#write ‘hola’ to a file with elevated privileges using sudo and tee.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#Runs a shell command as root to append the text "chao" to a protected file in /etc.
sudo -i
#Starts an interactive login shell with root privileges.
sudo su 
#Switches to the root user by starting a new shell with superuser privileges.
sudo su -
#Switches to the root user and loads their full login environment.
echo "$HOME"
#Expands the variable and prints the value of HOME.
echo '$HOME'
#Prints the literal string $HOME without expanding it.
echo '#!/bin/sh' > hola.sh
#Creates the script file and writes the shebang line.
echo 'echo "Hola desde mi primer script"' >> hola.sh
#Appends a line to print a message in the script.
cat hola.sh
#Displays the contents of the script.
./hola.sh
#Attempts to execute the script (may fail if not executable yet).
ls -l hola.sh
#Shows file permissions and details.
chmod +x hola.sh
#Adds execute permission to the script.
ls -l hola.sh
#Verifies that execute permission was added.
./hola.sh
#Executes the script successfully.
ls /etc
#Lists the contents of the /etc directory.
sudo touch /etc/prueba.txt
#Attempts to create an empty file in /etc (requires root privileges).
mkdir ~/mi_carpeta
#Creates a directory named mi_carpeta in the user's home directory.
apt install cowsay
#Installs the cowsay package using the package manager (requires sudo).
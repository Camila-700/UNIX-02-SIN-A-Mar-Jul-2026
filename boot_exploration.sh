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

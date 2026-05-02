ls 
#The ls command displays a list of information about files.
aptitude moo
#displays a fun Easter egg message from the Aptitude package manager.
ls -l 
#lists files and directories in the current folder using a detailed long format.
ls -r
#lists files and directories in reverse order.
aptitude -v moo
#displays a more verbose version of Aptitude’s fun Easter egg message.
aptitude -vv moo
#Displays an even more verbose version of Aptitude’s Easter egg message.
aptitude -vvv moo
#Displays a very verbose version of Aptitude’s Easter egg message.
pwd 
#Prints the current working directory.
cd Documents      
#Changes the current directory to Documents.
cd /
#Changes the current directory to the root directory.
cd /home/sysadmin
#Changes the current directory to /home/sysadmin.
cd ..
#Moves up one directory level.
cd ~
#Changes the current directory to the user’s home directory.
ls -l /var/log/
#Lists the contents of /var/log/ in long detailed format.
ls -lt /var/log 
#Lists /var/log in long format, sorted by modification time.
ls -l -S /var/log  
#Lists /var/log in long format, sorted by file size.
ls -lSr /var/log
#Lists /var/log in long format, sorted by size in reverse order.
ls -r /var/log 
#Lists /var/log in reverse order.
su  -
#Switches to the root user with a login shell.
exit
#Exits the current shell or user session.
sl
#Runs the sl program, which usually shows a steam locomotive animation.
sudo sl
#Runs the sl program with administrator privileges.
cd ~/Documents
#Changes the current directory to the Documents folder inside the user’s home directory.
ls -l hello.sh 
#Shows detailed information about the file hello.sh.
./hello.sh            
#Shows detailed information about the file hello.sh.
chmod u+x hello.sh
#Adds execute permission for the owner of hello.sh.
sudo chown root hello.sh
#Changes the owner of hello.sh to root.
sudo ./hello.sh  
#Runs the script hello.sh with administrator privileges.
cat animals.txt
#Displays the contents of animals.txt.
head alpha.txt
#Displays the first lines of alpha.txt.
tail alpha.txt
#Displays the last lines of alpha.txt.
head -n 5 alpha.txt      
#Displays the first 5 lines of alpha.txt.
tail -n 5 alpha.txt 
#Displays the last 5 lines of alpha.txt.
cp /etc/passwd .
#Copies /etc/passwd to the current directory.
dd if=/dev/zero of=/tmp/swapex bs=1M count=50 
#Creates a 50 MB file named /tmp/swapex filled with zeros.

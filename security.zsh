umask
#Displays the current default permission mask.
touch archivo 1 
#Creates an empty file named archivo1 or updates its timestamp if it already exists.
mkdir directorio 1
#Creates a new directory named directorio1.
ls -l 
#Lists files and directories in long format, showing permissions, owner, size, and date.
umask 027 
#Sets the default permission mask so new files and directories have more restricted permissions.
touch archivo2
#Creates an empty file named archivo2 using the current umask permissions.
mkdir directorio2
#Creates a new directory named directorio2 using the current umask permissions.
ls -l 
#Shows the detailed permissions of the created files and directories.
apt-get update
# Updates the package list from the configured repositories.
apt-get install acl
# Installs the ACL package, which provides the setfacl and getfacl commands.
chown -R $(whoami) .
# Changes the owner of the current directory and all its contents to the current user.
setfacl -bnR .
# Removes all extended ACL permissions recursively from the current directory.
touch archivo3
# Creates an empty file named archivo3 or updates its timestamp if it already exists.
mkdir directorio3
# Creates a new directory named directorio3.
ls -l
# Lists files and directories in long format, showing permissions, owner, size, and date.
umask 022
# Sets the default permission mask so new files are usually created with 644 permissions and new directories with 755 permissions.
whoami 
#Displays the username of the current user.
echo "Hola" > mi_archivo 
#Writes the text "Hola" into a file named mi_archivo, creating or overwriting it.
ls -l mi_archivo
#Shows detailed information about mi_archivo, including permissions, owner, size, and date.
useradd -m -s /usr/bin/zsh luna
#Creates a new user named luna with a home directory and sets zsh as the login shell.
chown luna mi_archivo
#Changes the owner of mi_archivo to the user luna.
groups
# Displays the groups that the current user belongs to.
groupadd grupo_test
# Creates a new group named grupo_test.
groups
# Displays the current user's groups again; grupo_test does not appear because no user has been assigned to it yet.
touch comun
# Creates an empty file named comun or updates its timestamp if it already exists.
ls -l comun
# Shows detailed information about comun, including permissions, owner, group, size, and date.
usermod -a -G grupo_test luna
# Adds the user luna to the supplementary group grupo_test without removing her from other groups.
chgrp grupo_test comun
# Changes the group ownership of the file comun to grupo_test.
ls -l comun
# Shows detailed information about comun, including its updated group ownership.
sudo chown luna:grupo_test mi_archivo
# Changes the owner of mi_archivo to luna and its group ownership to grupo_test.
ls -l mi_archivo
# Shows detailed information about mi_archivo, including its updated owner and group.

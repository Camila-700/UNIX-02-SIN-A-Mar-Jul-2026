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
mkdir -p proyecto/sub
# Creates the proyecto directory and its sub directory, including parent directories if needed.
touch proyecto/readme proyecto/sub/datos
# Creates empty files named readme and datos inside the proyecto directory structure.
sudo chown -R luna:grupo_test proyecto
# Recursively changes the owner to luna and the group to grupo_test for proyecto and everything inside it.
ls -lR proyecto
# Lists the proyecto directory recursively in long format, showing updated permissions, owner, group, size, and date.

#View the current user's numeric ID
#Numeric user ID, primary group, secondary groups
id
#View all system users
cat /etc/passwd | head -10 
#Displays the groups associated with the user stored in the variable $Luna  
groups $Luna
#View the current user's UID and GID
id -u
#User ID
id -g
#Group principal Id 
id -G
#All Group IDs
cat /etc/group | grep codespace
#Creates a new directory named proyecto_unix inside the user's home directory
mkdir ~/proyecto_unix/
#Displays detailed information about the contents of the directory proyecto_unix, including hi 
ls -la ~/proyecto_unix/
#Creates a new group named desarrolladores in the system
groupadd desarrolladores 
#Creates a new group named operaciones with the group ID (GID) 2000
groupadd -g 2000 operaciones
#Creates a system group named servicios_web, usually used for system services or applications
groupadd --system servicios_web
#Searches the /etc/group file for the groups desarrolladores, operaciones, or servicios_web
grep "desarrolladores\|operaciones\|servicios_web"/etc/group
#Uses extended regular expressions to search the /etc/group file for the groups desarroladores 
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
#Searches the /etc/login.defs file for the configuration values GID_MIN, GID_MAX, and SYS_GID,
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#Creates a new user group named marketing with the group ID (GID) 2100
addgroup --gid 2100 marketing
#Creates a system group named cache_web, usually used for system services or background process
addgroup --system cache_web
#Searches the /etc/group file for the groups diseno, marketing, or cache_web and displays them
grep "diseno\|marketing\|cache_web" /etc/group
#Adds the user root to the group diseno without removing the user from other existing groups
usermod -aG diseno root 
#Creates a new group name 'grupo_temporal' in the system
groupadd grupo_temporal
#Adds the user 'root' to the group 'grupo_temporal' without removing the user from the group
usermod -aG grupo_temporal root
#Displays detailed information about the user 'root', including the user ID (UID), primary group
id root 
#Changes the supplementary groups of the user root and assigns only the group desarrolladores
usermod -G desarrolladores root
#Displays detailed information about the user root, including the user ID (UID), primary group
id root 
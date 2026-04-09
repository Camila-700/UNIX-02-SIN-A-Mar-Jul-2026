git branch 
#To check the branch you are in
git checkout 
#To switch between branches
mkdir proyecto
#Creates a new folder named "proyecto" in your current location.
cd /proyecto
#Moves you to a folder named "proyecto" located at the root level of the system.
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto
#Navigates directly to that specific folder path.
cd
#Takes you back to your Home directory immediately.
cd ~
#Also takes you to your Home directory.
cd $HOME
#Moves you to your Home directory.
cd $PATH
#This command will usually fail or give an error.
ls -lai
#Lists all files in a long list format with index numbers.
man ls 
#Opens the manual page for the ls command.
ls --all = ls -a
#These are identical commands.
cd..
#Moves you up one level to the parent folder.
.
#Represents the current directory.
..
#Represents the parent directory.
total 8
1572972 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..
#total 8: The total disk space (in blocks) used by the listed files.
#1572972 / 1572874: The Inode number, which is the unique ID for that specific folder.
#drwxrwxrwx+: The Permissions. The d means directory, and rwx means Read, Write, and Execute.
#2 / 5: The number of Hard Links pointing to this directory.
#codespace: The name of the User who owns the folder.
#codespace / root: The name of the Group that owns the folder.
#4096: The Size of the directory metadata in bytes.
#Apr 9 12:19: The Timestamp of the last time the folder was modified.
#.: The symbol for the Current Directory.
#..: The symbol for the Parent Directory (one level up).
stat . 
#Displays detailed status and information about the current directory.
Device: 7,4     Inode: 1572972     Links: 2
#"DNA": Device (7,4) is the hardware address where it is stored, Inode (1572972) is its unique system ID number, 
#and Links (2) shows how many references point to it (usually the folder name and the . symbol).
whoami
#Displays the username of the current user.
ls -lt 
#Lists files sorted by time.
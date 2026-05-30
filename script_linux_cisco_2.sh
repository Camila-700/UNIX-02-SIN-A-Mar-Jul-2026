# Move the file people.csv into the Work directory.
mv people.csv Work

# Verify that people.csv was moved into the Work directory.
ls Work

# Move numbers.txt, letters.txt, and alpha.txt into the School directory.
mv numbers.txt letters.txt alpha.txt School

# Verify that the files were moved into the School directory.
ls School

# Try to move numbers.txt, letters.txt, and alpha.txt into School again.
mv numbers.txt letters.txt alpha.txt School

# Verify the contents of the School directory again.
ls School

# List the contents of the current Documents directory.
ls

# Rename animals.txt to zoo.txt.
mv animals.txt zoo.txt

# Verify that animals.txt was renamed to zoo.txt.
ls

# Change to the Documents directory.
cd ~/Documents

# Remove the file linux.txt.
rm linux.txt

# Verify that linux.txt no longer exists.
ls linux.txt

# Try to remove the Work directory using rm.
rm Work

# Remove the Work directory and its contents recursively.
rm -r Work

# Verify that the Work directory no longer exists.
ls Work

# Change to the Documents directory.
cd ~/Documents

# Copy the /etc/passwd file into the current directory.
cp /etc/passwd .

# Search for the sysadmin user entry inside the copied passwd file.
grep sysadmin passwd

# Change to the Documents directory.
cd ~/Documents

# Search for the sysadmin user entry in the passwd file.
grep sysadmin passwd

# Search for lines that contain the word root in the passwd file.
grep 'root' passwd

# Search for lines that start with root in the system passwd file.
grep '^root' /etc/passwd

# Display the contents of alpha-first.txt.
cat alpha-first.txt

# Search for lines that end with the letter r in alpha-first.txt.
grep 'r$' alpha-first.txt

# Display the contents of red.txt.
cat red.txt

# Search for lines that contain r, followed by any two characters, followed by f.
grep 'r..f' red.txt

# Search for lines that contain r, followed by any two characters, followed by d.
grep 'r..d' red.txt

# Search for lines that contain at least four characters.
grep '....' red.txt

# Search the system passwd file for lines containing r, any two characters, and t.
grep 'r..t' /etc/passwd

# Display the contents of profile.txt.
cat profile.txt

# Search for lines that contain at least one digit.
grep '[0-9]' profile.txt

# Search for lines that contain at least one non-digit character.
grep '[^0-9]' profile.txt

# Search for lines that contain a literal period character.
grep '[.]' profile.txt

# Display the contents of red.txt again.
cat red.txt

# Search for lines with r followed by zero or more e characters and then d.
grep 're*d' red.txt

# Search for lines with r followed by zero or more o or e characters and then d.
grep 'r[oe]*d' red.txt

# Search for lines with zero or more z characters.
grep 'z*' red.txt

# Search for lines with zero or more e characters.
grep 'e*' red.txt

# Search for lines with one e followed by zero or more e characters.
grep 'ee*' red.txt

# Return to the home directory.
cd ~

# Switch to the root user using a login shell.
su -

# Shut down the system immediately.
shutdown now

# Display the current system date and time.
date

# Schedule a system shutdown at 01:51.
shutdown 01:51

# Schedule a system shutdown one minute from now with a custom message.
shutdown +1 "Goodbye World!"

# Display network interface configuration, including IP address and packet statistics.
ifconfig

# Send four ICMP echo requests to the local eth0 IP address to test connectivity.
ping -c 4 192.168.1.2

# Send four ICMP echo requests to another host on the network.
# Note: this test fails with "Destination Host Unreachable" because the host is not reachable.
ping -c 4 192.168.1.3

# Exit the root shell and return to the previous user session.
exit

# Display processes running in the current terminal session.
ps

# Display all processes running on the system.
ps -e

# Display all processes with full-format details, including UID, PID, PPID, and CMD.
ps -ef

# Update the local package index using apt-get.
sudo apt-get update

# Search the package cache for packages related to "cow".
apt-cache search cow

# Install the cowsay package.
sudo apt-get install cowsay

# Run cowsay with the message "NDG Linux Unhatched".
cowsay 'NDG Linux Unhatched'

# Update the local package index again.
sudo apt-get update

# Upgrade installed packages to their latest available versions.
sudo apt-get upgrade

# Remove the cowsay package and its configuration files.
sudo apt-get purge cowsay

# Change the password for the current sysadmin user.
passwd

# Display password status information for the sysadmin user.
passwd -S sysadmin

# Switch to the root user.
su root

# Change the password for the sysadmin user as root.
passwd sysadmin

# Exit the root shell and return to the previous user session.
exit

# List the contents of the Documents directory.
ls ~/Documents

# List the contents of the current home directory.
ls

# Try to list a file that does not exist.
# Note: this command returns an error because fakefile does not exist.
ls fakefile

# Change to the Documents directory.
cd ~/Documents

# Display the contents of food.txt.
cat food.txt

# Redirect the output of food.txt into newfile1.txt.
# Note: the > operator creates or overwrites the destination file.
cat food.txt > newfile1.txt

# Display the contents of newfile1.txt.
cat newfile1.txt

# Print the word Hello to the terminal.
echo "Hello"

# Display the contents of newfile1.txt again.
cat newfile1.txt

# Overwrite newfile1.txt with the text "I like food."
echo "I like food." > newfile1.txt

# Display the updated contents of newfile1.txt.
cat newfile1.txt

# Append the text "This food is good." to newfile1.txt.
# Note: the >> operator adds content to the end of the file without overwriting it.
echo "This food is good." >> newfile1.txt

# Display newfile1.txt to verify the appended line.
cat newfile1.txt

# Open newfile.txt in the vi text editor.
vi newfile.txt



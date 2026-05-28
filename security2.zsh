# View user and group identity information
id

# View the current group
id -gn

# Show only the name of the primary group
touch ~/test_grupo_heredado.txt

# Create a file and check which group it inherits
ls -la ~/test_grupo_heredado.txt

# The group is the user's primary group
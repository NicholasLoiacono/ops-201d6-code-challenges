# Step 1: Set up a Share on the network.
# The batch file is actually two files. One runs at user log on and one runs at user log off. When the batch files run, they create a rolling log file with the details in a shared network folder.

# 1) Create a shared folder on the network. Mine is called Logs. Everyone should have full access to this share. 2) In that folder, create a folder called User and a folder called Computer.

# Step 2: Create the batch files.
# Copy and Paste the following into two separate text files. When you save them, remember to change the file type to .bat

# Name: Log On.bat

# rem The following line creates a rolling log file of usage by workstation echo Log In %Date% %TIME% %USERNAME% >> \servername\Logs\Computer\%COMPUTERNAME%.log

# rem The following line creates a rolling log file of usage by user echo Log In %Date% %TIME% %COMPUTERNAME% >> \servername\Logs\User\%USERNAME%.log

# Name: Log Off.bat

# rem The following line creates a rolling log file of usage by workstation echo Log Off %Date% %TIME% %USERNAME% >> \servername\Logs\Computer\%COMPUTERNAME%.log

# rem The following line creates a rolling log file of usage by user echo Log Off %Date% %TIME% %COMPUTERNAME% >> \servername\Logs\User\%USERNAME%.log

# Put these files in the Logs folder.

# Step 3: Add the batch files to group policy.
# You do this on your User Container GPO.

# User Configuration > Windows Settings > Scripts

# Add Log In.bat to the Logon scripts box and Log Off.bat to the Logoff scripts box

# Now you have a rolling log file detailing when and where each user Logs On and Logs Off.

# Enjoy

# EDIT: As some have pointed out, you dont need to give everyone full access to the share. I did this just to make sure that it would work. You can give your groups read write access and then make the folder an admin share.

# References
# TheITGuy. (2018, January 11). How to: Monitor user log in and log off without 3rd party software. Spiceworks. https://community.spiceworks.com/how_to/82-monitor-user-log-in-and-log-off-without-3rd-party-software

#!/bin/bash
show_login_history() {
    local username=$1
    local num_logins=${2:-10}

    last -n $num_logins -x $username
}
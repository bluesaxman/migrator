#!/bin/sh

#Get the arguments from the command line, -i is for the old account -o is for the new
# -i <IP Address>:<Username>:<Password> -o <IP Address>:<Username>:<Password>

#validate userinput
#Usernames should be letters and numbers
#Password must be between 1 - 255 characters
#IP Address must be a valid IP address

#Determain access level on -i
#if no SSH access Error: SSH access required! Logins for -i failed to access SSH

#Determain access level on -o
#if no SSH access Error: SSH access required! Logins for -o failed to access SSH

#copy package.sh to -i and wait for it to signal that its complete
#check "complete" file for any errors, if there are errors die Print the errors. 
#make custom changes to movein.sh
#copy movein.sh to -o and execute it.

#Wait for movein.sh to signal it is complete. 

#Migration Complete, thank you for using Migrator.

# migrator
An easy automated way to migrated (From most) hosting accounts to a cpanel hosting account. 

Description:
This projects aim is to create an automated way to move a hosting account from one host to another with only the knowledge of what the SSH logins for both accounts are. 

Requirements:
SSH access on both hosting accounts.
cPanel on the hosting account you are moving to.
Twocows email on the hosting account you are moving to.


Syntax:

migrator.sh -i <IP Address>:<Username>:<Password> -o <IP Address>:<Username>:<Password>

-i    The old hosting account
-o    The new hosting account

Each account is represented by a string containing the IP User and password. seperated by a : 


Notes:
I'm originally writing this in bash for protibility, however I intend (for my own education) to write versions of this in perl and in c as well. 

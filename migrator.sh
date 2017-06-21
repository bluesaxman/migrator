#!/bin/sh

#Get the arguments from the command line, -i is for the old account -o is for the new
# -i <IP Address>:<Username>:<Password> -o <IP Address>:<Username>:<Password>
while getopts ":i:o:" opt; do
        case $opt in
                i)
                        echo "We will be getting stuff from $OPTARG" >&2
                        INGRESS=$OPTARG
                        ;;
                o)
                        echo "We will be putting stuff in $OPTARG" >&2
                        EGRESS=$OPTARG
                        ;;
                \?)
                        echo "Invalid option: -$OPTARG" >&2
                        exit 1
                        ;;
                :)
                        echo "Option -$OPTARG requires a login string formatted <IP Address>:<Username>:<Password>" >&2
                        exit 1
                        ;;
        esac
done

ERRORMESS="You have not provided all the options needed to run, please provide both -i and -o
"

#Check for all the options
if [[ ! "$INGRESS" ]]; then
        echo $ERRORMESS
        exit 1
fi
if [[ ! "$EGRESS" ]]; then
        echo $ERRORMESS
        exit 1
fi

#split up all out inputs to their stuff
IFS=':' read -ra INFO <<< "$INGRESS"
INADDRESS=${INFO[0]}
INUSERNAME=${INFO[1]}
INPASSWORD=${INFO[2]}
IFS=':' read -ra OUTFO <<< "$EGRESS"
OUTADDRESS=${OUTFO[0]}
OUTUSERNAME=${OUTFO[1]}
OUTPASSWORD=${OUTFO[2]}

ERRORMESS="Information entered did not validate make sure to have:
A username with only letters and numbers.
A password between 1 - 255 characters.
A valid IPv4 address."
#validate userinput
#Usernames should be letters and numbers
if [[ $INUSERNAME =~ ^([a-z][A-Z][0-9]-_)*$ ]]; then
        echo $ERRORMESS
        echo $INUSERNAME
        exit 1
fi
if [[ $OUTUSERNAME =~ ^([a-z][A-Z][0-9]-_)*$ ]]; then
        echo $ERRORMESS
        echo $OUTUSERNAME
        exit 1
fi
#Password must be between 1 - 255 characters
if [[ $INPASSWORD =~ ^.{1-255}$ ]]; then
        echo $ERRORMESS
        echo $INPASSWORD
        exit 1
fi
if [[ $OUTPASSWORD =~ ^.{1-255}$ ]]; then
        echo $ERRORMESS
        echo $OUTPASSWORD
        exit 1
fi
#IP Address must be a valid IP address
if [[ $INADDRESS =~ ^[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}$ ]]; then
        echo $ERRORMESS
        echo $INADDRESS
        exit 1
fi
if [[ $OUTADDRESS =~ ^[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}$ ]]; then
        echo $ERRORMESS
        echo $OUTADDRESS
        exit 1
fi

#Determain access level on -i
echo "Testing ability to ssh to $INADDRESS"
#if no SSH access Error: SSH access required! Logins for -i failed to access SSH
sshpass -p$INPASSWORD ssh -o StrictHostKeyChecking=no $INUSERNAME@$INADDRESS 'exit'
if [ $? > 0 ]; then
        echo "There were problems connecting to $INADDRESS"
        exit 1
fi
#Determain access level on -o
echo "Testing ability to ssh to $OUTADDRESS"
#if no SSH access Error: SSH access required! Logins for -o failed to access SSH
sshpass -p$OUTPASSWORD ssh -o StrictHostKeyChecking=no $OUTUSERNAME@$OUTADDRESS 'exit'
if [ $? > 0 ]; then
        echo "There were problems connecting to $OUTADDRESS"
        exit 1
fi

#copy package.sh to -i and wait for it to signal that its complete
sshpass -p$INPASSWORD scp -o StrictHostKeyChecking=no ./package.sh $INUSERNAME@$INADDRESS:~/package.sh
sshpass -p$INPASSWORD ssh -o StrictHostKeyChecking=no $INUSERNAME@$INADDRESS 'bash ./package.sh'
#check "complete" file for any errors, if there are errors die Print the errors. 
sshpass -p$INPASSWORD scp -o StrictHostKeyChecking=no $INUSERNAME@$INADDRESS:~/complete.txt ./$INADDRESS-complete.txt
#TODO#Add error checking
#make custom changes to movein.sh
#copy movein.sh to -o and execute it.
sshpass -p$OUTPASSWORD scp -o StrictHostKeyChecking=no ./movein.sh $OUTUSERNAME@$OUTADDRESS:~/movein.sh
sshpass -p$OUTPASSWORD ssh -o StrictHostKeyChecking=no $OUTUSERNAME@$OUTADDRESS 'bash ./movein.sh'
#Wait for movein.sh to signal it is complete. 
#Migration Complete, thank you for using Migrator
echo "Migration Complete, thank you for using Migrator!".

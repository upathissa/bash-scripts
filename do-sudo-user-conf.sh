#! /bin/bash
printf "This script will\n1. Add This user to Sudo group\n2. Enagle access through ssh to this user\n"
read -p "Enter username : " USER_NAME
cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "User Exists"
    
    usermod -aG sudo ${USER_NAME}
    if [ $? -eq 0 ]; then
    	echo "User added to the sudo group complete"
    fi
    
    #resync ssh keys
    rsync --archive --chown=${USER_NAME}:${USER_NAME} ~/.ssh /home/${USER_NAME}
	
else
    echo "User Not Found"
fi

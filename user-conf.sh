#! /bin/bash
read -p "Enter username : " USER_NAME
cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "User Exists"
    
    usermod -aG sudo ${USER_NAME}
    if [ $? -eq 0 ]; then
    	echo "User added to the sudo group complete"
    fi
 

    #allow ssh
    ufw allow OpenSSH

    #enable ufw
    ufw allow OpenSSH
    
    echo "$(ufw status)"
    
    #resync ssh keys
    rsync --archive --chown=${USER_NAME}:${USER_NAME} ~/.ssh /home/${USER_NAME}
	
else
    echo "User Not Found"
fi

#!/bin/bash
#-------------password system using While loop-------------#
: '
correct_password="linux123"
read -p "Enter a password:" user_input
while [ "$user_input" != "$correct_password" ]
do
    echo "Passsword is Wrong! Try Again."
    read -p "Again Enter Passsword:" user_input
done
echo "Access Granted sucessfully"
'

#---------------file Handling-----------------#
: '
for i in {1..3}
do 
    touch "file_$i.txt"
done
echo "file created successfully"
'

#--------------Backup script---------------#

cp -r /mnt/d/bash_script/gitcentral/bash2/ /mnt/d/bash_script/gitcentral/Bash_script/backup/

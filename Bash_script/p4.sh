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

s_folder="/mnt/d/bash_script/gitcentral/bash2"
b_folder="/mnt/d/bash_script/gitcentral/Bash_script/backup"
Date=$(date +%y-%m-%d)
n_file="backup_file_${Date}_tar.gz"
 if [ ! -d "$b_folder" ]
 then
    mkdir -p "$b_folder"
fi
                        # -C ka use simple words mein "Rasta Badalne" ke liye hota hai.
tar -czf "$b_folder/$n_file" -C "/mnt/d/bash_script/gitcentral/" bash2

# 1) Leading Slash Warning: tar aapko warning deta hai ki wo / hata raha hai.

# 2) Ganda File Structure: Jab aap us backup ko extract karenge, toh wo seedha bash2 nahi nikalega. 
    # Wo pehle mnt folder banayega, uske andar d, uske andar bash_script... aur aise karte-karte bohot andar jaakar aapki files milengi.

# -C use karne se:
         # tar pehle /mnt/d/bash_script/gitcentral ke andar jata hai.

         # Wahan khade hokar wo sirf bash2 ko dekhta hai aur uska backup le leta hai.
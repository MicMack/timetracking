#!/usr/bin/bash
#create user
useradd -G wheel -p yN3EPxBuw8C3M timestudy
userdel -r user

#creating the folders
echo "Making app folders"
mkdir -p /opt/timestudy/archived
mkdir -p /media/timestudyhost
chmod -R 755 /opt/timestudy/
chown -R timestudy /opt/timestudy/

#moving assets
echo "Moving files"
mv tist/assets/hi.smbcredentials /root/smbcred
mv tist/tt.py /opt/timestudy/
mv tist/rename.sh /opt/timestudy/

#setting autologin
mv tist/assets/getty@.service /usr/lib/systemd/system/getty@.service

#editing the config files
echo '//10.1.140.49/Foothill_Data      /media/timestudyhost          cifs    credentials=/root/smbcred        0 0' >> /etc/fstab
echo 'python /opt/timestudy/tt.py' >> /home/timestudy/.bash_profile
echo '0 8,12,16,20 * * * root /opt/timestudy/rename.sh' >> /etc/crontab

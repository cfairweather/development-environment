#!/bin/bash

set -e


id -u $USER &>/dev/null || useradd -d /home/$USER -s /bin/bash $USER
cp /etc/skel/.* /home/$USER || echo "Skeleton files already exist"

#Fix for SSH
# https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/45234
if [ ! -d /var/run/sshd ]; then
   mkdir /var/run/sshd
   chmod 0755 /var/run/sshd
fi


cp -r /.ssh /home/$USER/
chmod 700 /home/$USER/.ssh
chmod 400 /home/$USER/.ssh/*
chown -R cfairweather:cfairweather /home/$USER

# Sudo permissions
usermod -a -G sudo $USER

# SSH Color in prompt
wget https://gist.githubusercontent.com/cfairweather/e795b671f2ec08c1d662a77a874f26c6/raw/512e8c6763aea5668b5b091d43f80c6add397597/ubuntu-ssh-color.sh
chmod +x ubuntu-ssh-color.sh

./ubuntu-ssh-color.sh
su -c ./ubuntu-ssh-color.sh $USER

/usr/sbin/sshd -D 
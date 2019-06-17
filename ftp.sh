#!/bin/bash

yum install vsftpd -y
   systemctl start vsftpd
          firewall-cmd --zone=public --permanent --add-port=21/tcp
          firewall-cmd --zone=public --permanent --add-service=ftp
          firewall-cmd --reload

cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig
sed -i 's/anonymous_enable=YES/anonymous_enable=NO/'  /etc/vsftpd/vsftpd.conf
echo "chroot_local_user=YES" >>/etc/vsftpd/vsftpd.conf
echo "allow_writeable_chroot=YES" >>/etc/vsftpd/vsftpd.conf

echo "userlist_enable=YES" >>/etc/vsftpd/vsftpd.userlist
echo "user_list=/etc/vsftpd/vsftpd.userlist" >>/etc/vsftpd/vsftpd.userlist
echo "userlist_deny=NO" >>/etc/vsftpd/vsftpd.userlist

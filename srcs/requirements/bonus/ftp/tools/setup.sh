#!/bin/sh

echo -e "$FTP_PASSWORD\r$FTP_PASSWORD" | adduser $FTP_USERNAME

vsftpd /etc/vsftpd/vsftpd.conf

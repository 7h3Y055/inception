#!/bin/sh

echo -e "$FTP_PASSWORD\r$FTP_PASSWORD" | adduser $FTP_USERNAME

# chown -R $FTP_USERNAME:$FTP_USERNAME /var/www/html/wordpress

vsftpd /etc/vsftpd/vsftpd.conf
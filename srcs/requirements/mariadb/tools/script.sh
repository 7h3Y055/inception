#!/bin/sh


mysql_install_db --user=mysql --datadir=/var/lib/mysql

mysqld_safe --skip-networking &
sleep 2

# mysql_secure_installation 2>/out1 <<EOF
    
#     n
#     y
#     $MARIADB_ROOT_PASSWORD
#     $MARIADB_ROOT_PASSWORD
#     y
#     y
#     y
#     y
# EOF


mysql -u root 2>/out2 <<EOF
    CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
    CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';
    GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_USER'@'%';
    FLUSH PRIVILEGES;
EOF

sleep 1

mysqladmin -u root shutdown 2>/out3 &

exec mysqld --user=mysql --console 2>/out4

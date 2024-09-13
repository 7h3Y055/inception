#!/bin/sh


mysql_install_db --user=mysql --datadir=/var/lib/mysql

mysqld_safe --skip-networking &
sleep 1.5

mysql_secure_installation <<EOF
    
    n
    y
    $MARIADB_ROOT_PASSWORD
    $MARIADB_ROOT_PASSWORD
    y
    y
    y
    y
EOF

mysql -u root 2>/error 1>/out <<EOF
    CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
    CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';
    GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_USER'@'%';
    FLUSH PRIVILEGES;
EOF


mysqladmin -u root shutdown

exec mysqld --user=mysql --console

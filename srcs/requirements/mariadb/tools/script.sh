#!/bin/sh


mysql_install_db --user=mysql --datadir=/var/lib/mysql

mysqld_safe --skip-networking &
sleep 1

mysql_secure_installation <<EOF
    
    n
    y
    $mariadb_root_password
    $mariadb_root_password
    y
    y
    y
    y
EOF

mysql -u root  <<EOF
    CREATE DATABASE IF NOT EXISTS $wp_database_name;
    CREATE USER IF NOT EXISTS '$wp_user'@'%' IDENTIFIED BY '$wp_user_password';
    GRANT ALL PRIVILEGES ON $wp_database_name.* TO '$wp_user'@'%';
    FLUSH PRIVILEGES;
EOF


mysqladmin -u root shutdown

chown mysql:mysql /etc/my.cnf

exec mysqld --user=mysql --console

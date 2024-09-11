#!/bin/sh


cd /var/www/html

wget https://wordpress.org/latest.zip
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar

unzip latest.zip
rm latest.zip
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /bin/wp

sleep 2;
cd wordpress
/bin/wp config create --force --dbname=$wp_database_name --dbuser=$wp_user --dbpass=$wp_user_password --dbhost=mariadb

wp core install --url=$domain --title=$wp_title --admin_user=$admin_username --admin_password=$admin_password --admin_email=$admin_email

php-fpm82 -F

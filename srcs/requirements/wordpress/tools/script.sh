#!/bin/sh


cd /var/www/html

wget https://wordpress.org/latest.zip
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar

unzip latest.zip
rm latest.zip
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /bin/wp

sleep 10
cd wordpress

/bin/wp config create --force --dbname=$WP_DATABASE_NAME --dbuser=$WP_USER --dbpass=$WP_USER_PASSWORD --dbhost=mariadb --dbprefix=$WP_DB_PREFIX

/bin/wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

php-fpm82 -F

#!/bin/sh


cd /var/www/html

wget https://wordpress.org/latest.zip
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar

unzip latest.zip
rm latest.zip
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /bin/wp

php-fpm82 -F

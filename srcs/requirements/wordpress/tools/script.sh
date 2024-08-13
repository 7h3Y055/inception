#!/bin/sh


mkdir -p /srv/http
cd /srv/http

wget https://wordpress.org/latest.zip
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar

unzip latest.zip
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /bin/wp


php-fpm82 -F
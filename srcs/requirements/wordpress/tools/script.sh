#!/bin/sh


cd /var/www/html

wget https://wordpress.org/latest.zip
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar

unzip latest.zip
rm latest.zip
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /bin/wp

cd wordpress

while ! nc -z -w 1 mariadb 3306; do
  echo "Waiting for MariaDB..."
  sleep 0.5
done

/bin/wp config create --force --dbname=$WP_DATABASE_NAME --dbuser=$WP_USER --dbpass=$WP_USER_PASSWORD --dbhost=mariadb --dbprefix=$WP_DB_PREFIX
/bin/wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL


wp plugin install redis-cache --activate
sed -i "22i define('WP_REDIS_HOST', 'redis');" wp-config.php
wp redis enable


# BONUS {
  wp plugin install pexlechris-adminer --activate
  mkdir wp-adminer
  wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O wp-adminer/index.php
# }

touch STATUS

php-fpm82 -F




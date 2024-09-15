#!/bin/sh

mkdir -p $SSL_CRT_PATH

openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout $SSL_CRT_PATH/nginx.key \
    -out $SSL_CRT_PATH/nginx.crt \
    -subj "/C=MA/ST=RABAT/O=42/OU=1337/CN=$DOMAIN"

SSL_CRT_PATH_ESCAPED=$(echo "$SSL_CRT_PATH" | sed 's/\//\\\//g')

sed -i "s/\[SSL_CRT_PATH\]/$SSL_CRT_PATH_ESCAPED/" /etc/nginx/http.d/default.conf

while ! head -c 0 /var/www/html/wordpress/STATUS 2>/dev/null; do
  echo "Waiting for Wordpress..."
  sleep 0.5
done

nginx -g "daemon off;"

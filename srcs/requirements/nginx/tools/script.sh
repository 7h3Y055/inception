#!/bin/sh

mkdir -p $ssl_crt_path

openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout $ssl_crt_path/nginx.key \
    -out $ssl_crt_path/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

ssl_crt_path_escaped=$(echo "$ssl_crt_path" | sed 's/\//\\\//g')

sed -i "s/\[ssl_crt_path\]/$ssl_crt_path_escaped/" /etc/nginx/http.d/default.conf


nginx -g "daemon off;"

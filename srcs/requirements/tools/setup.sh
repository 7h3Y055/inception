#!/bin/bash

if [[ $(tail -n 1 /etc/hosts) != *"$DOMAIN"* ]];then
    echo "127.0.0.1	$DOMAIN" >> /etc/hosts
fi

mkdir -p /home/ybouchma/data/mariadb
mkdir -p /home/ybouchma/data/wordpress



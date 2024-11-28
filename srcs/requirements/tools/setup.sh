#!/bin/bash


if [[ $(tail -n 1 /etc/hosts) != *"$DOMAIN"* ]];then
    echo "127.0.0.1	$DOMAIN" >> /etc/hosts
fi

mkdir -p /home/$LOGIN/data/mariadb
mkdir -p /home/$LOGIN/data/wordpress



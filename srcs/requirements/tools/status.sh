#!/bin/bash

export C_DIR="./srcs/docker-compose.yml"


# | awk '/inception/{print "[+] Status: " $2}'
# if [["running" in $(docker-compose -f $C_DIR ls) ]]

# if [ "running" == *"$(echo arunninga )"* ];then
#     echo "1"
# else
#     echo "2"
# fi


# printf "[+] "
# docker-compose -f $C_DIR images 
docker-compose -f $C_DIR ps

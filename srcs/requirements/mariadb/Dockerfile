FROM alpine:3.19

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add mariadb --no-cache

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

CMD [ "mysqld_safe" ]
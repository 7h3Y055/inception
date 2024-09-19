FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache

RUN apk add --no-cache zip php php-fpm php-phar php-mysqli mariadb-client php82-mbstring php82-iconv php82-session


COPY ./tools/script.sh script.sh
COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
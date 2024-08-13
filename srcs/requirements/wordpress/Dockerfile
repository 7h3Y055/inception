FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add --no-cache zip php php-fpm php-phar php-mysqli

# RUN apk add php-fpm php-mysqli php-json php-opcache php-curl php-gd php-xml php-mbstring php-tokenizer php-fileinfo
# RUN apk add php-phar php-zip php-zlib php-exif php-dom php-simplexml php-iconv

COPY ./tools/script.sh script.sh

RUN chmod +x script.sh


#+++++++++++++++++++++
# RUN apk add nginx --no-cache
# COPY ./conf/default.conf /etc/nginx/http.d/default.conf
#+++++++++++++++++++++



CMD [ "./script.sh" ]


FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache

RUN apk add nginx --no-cache
RUN apk add openssl --no-cache


COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./tools/script.sh ./script.sh

# BONUS {
    COPY ./conf/index.html /
# }

RUN chmod +x ./script.sh

ENTRYPOINT ["./script.sh"]
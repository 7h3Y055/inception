FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add mariadb mariadb-client --no-cache


COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tools/script.sh ./script.sh
RUN chmod +x ./script.sh

ENTRYPOINT [ "./script.sh" ]
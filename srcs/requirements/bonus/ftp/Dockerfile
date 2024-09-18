FROM alpine:3.13

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add vsftpd --no-cache

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/setup.sh setup.sh

RUN chmod +x ./setup.sh

ENTRYPOINT ["./setup.sh"]
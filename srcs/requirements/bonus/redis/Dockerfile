FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache

RUN apk add redis --no-cache  

CMD ["--protected-mode", "no"]

ENTRYPOINT ["redis-server"]

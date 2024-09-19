FROM alpine:3.19

WORKDIR /

RUN apk update --no-cache

COPY ./tools/setup.sh .
RUN chmod +x ./setup.sh


ENTRYPOINT [ "./setup.sh" ]

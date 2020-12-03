FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xzf telegraf-1.16.3_linux_amd64.tar.gz
RUN cp -r /telegraf-1.16.3/etc/telegraf /etc/
RUN cp /telegraf-1.16.3/usr/bin/telegraf /usr/bin/

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk

COPY ./telegraf.conf /etc/telegraf/

ENTRYPOINT telegraf

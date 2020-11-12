FROM alpine:latest 

RUN apk update && apk upgrade
RUN apk add nginx vim
RUN mkdir -p /run/nginx

COPY ./nginxconfig /etc/nginx/conf.d/default.conf
COPY ./tlavelle.key /etc/ssl/private/self-signed.key
COPY ./tlavelle.crt /etc/ssl/certs/self-signed.crt
COPY ./services.sh /
RUN chmod +x /services.sh

EXPOSE 80 443

ENTRYPOINT ./services.sh

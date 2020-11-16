FROM alpine:latest 

RUN apk update && apk upgrade
RUN apk add nginx vim openrc openssh supervisor
RUN mkdir -p /run/nginx
RUN mkdir -p /root/.ssh/

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tlavelle.key /etc/ssl/private/self-signed.key
COPY ./tlavelle.crt /etc/ssl/certs/self-signed.crt
COPY ./ssh_keys/ssh_key.pub /root/.ssh/authorized_keys
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./services.sh /
RUN echo -e "root\nroot" | passwd
RUN chmod +x /services.sh

EXPOSE 80 443 22

ENTRYPOINT ./services.sh

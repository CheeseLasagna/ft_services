FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc

RUN adduser -D -h /home/tlavelle tlavelle
RUN echo "tlavelle:password" | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tlavelle.crt /etc/ssl/certs/self-signed.pem
COPY ./tlavelle.key /etc/ssl/private/self-signed.key

COPY start.sh / 
RUN chmod +x start.sh

EXPOSE 20 21 44000

ENTRYPOINT ./start.sh

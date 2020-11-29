FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx wget supervisor php7 php7-fpm php7-mysqli php7-json php7-mbstring php7-xml php7-gd php7-curl php7-session php7-zlib php7-opcache 

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf

RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz

COPY ./wp-config.php /wordpress/
COPY ./start-wp.sh /

RUN mkdir -p run/nginx
RUN chmod +x /start-wp.sh

EXPOSE 5050

ENTRYPOINT ./start-wp.sh

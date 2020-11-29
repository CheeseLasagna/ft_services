FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx wget supervisor php7 php7-fpm php7-mysqli php7-json php7-mbstring php7-xml php7-gd php7-curl php7-session php7-zlib php7-opcache 

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages/ phpmyadmin/

COPY ./config.inc.php /phpmyadmin/
COPY ./start-phpmyadmin.sh /

RUN mkdir -p run/nginx
RUN chmod +x /start-phpmyadmin.sh

EXPOSE 5000

ENTRYPOINT ./start-phpmyadmin.sh

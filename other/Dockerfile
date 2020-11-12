FROM debian:buster

RUN apt update && apt -y upgrade
RUN apt install -y vim nginx wget php7.3 php7.3-fpm php-json php-mbstring php-mysql default-mysql-server wordpress 
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar xvf phpMyAdmin-5.0.2-all-languages.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

COPY ./srcs/services.sh ./srcs/dtb.sql /
COPY ./srcs/wp-config.php /usr/share/wordpress/
COPY ./srcs/default /etc/nginx/conf.d/default.conf
COPY ./srcs/tlavelle.key /etc/ssl/private/ssl-cert-snakeoil.key
COPY ./srcs/tlavelle.crt /etc/ssl/certs/ssl-cert-snakeoil.pem

RUN mv usr/share/wordpress /var/www/html

RUN chown -R www-data /var/www/html
RUN service mysql start && mysql < dtb.sql

ENTRYPOINT bash services.sh 

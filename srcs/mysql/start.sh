#!/bin/sh

openrc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root mysql < database.sql
mysql -u root my_database < my_database.sql
service mariadb stop
/usr/bin/mysqld_safe

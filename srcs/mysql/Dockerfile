FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add vim mysql mysql-client openrc 

COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./start.sh .
COPY ./database.sql .
COPY ./my_database.sql .

EXPOSE 3306

ENTRYPOINT /bin/sh start.sh 


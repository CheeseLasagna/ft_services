#!/bin/bash

#Starting Minikube
minikube start

#Starting and configuring metallb
minikube addons enable metallb
minikube kubectl -- apply -f ./srcs/metallb.yaml

eval $(minikube docker-env)

#Starting nginx
docker build -t nginx_image ./srcs/nginx/
minikube kubectl -- apply -f ./srcs/nginx/nginx.yaml

#Starting mysql 
docker build -t mysql_image ./srcs/mysql/
minikube kubectl -- apply -f ./srcs/mysql/mysql.yaml

#Starting wordpress 
docker build -t wordpress_image ./srcs/wordpress/
minikube kubectl -- apply -f ./srcs/wordpress/wordpress.yaml

#Starting phpmyadmin 
docker build -t phpmyadmin_image ./srcs/phpmyadmin/
minikube kubectl -- apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

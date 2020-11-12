#!/bin/bash

#Starting Minikube
minikube start
eval $(minikube docker-env)

#Starting and configuring metallb
minikube addons enable metallb
minikube kubectl -- apply -f ./srcs/metallb.yaml

#Starting nginx
docker build -t nginx_image ./srcs/nginx/
minikube kubectl -- apply -f ./srcs/nginx.yaml

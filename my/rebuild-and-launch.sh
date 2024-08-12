#!/bin/sh

# delete if exists
minikube delete -p petr-polyakov-kuber-sf

# needed for podman
minikube config set rootless false
# docker context use rootless

# create
minikube config set driver docker
minikube kubectl -- get po -A
minikube start --nodes 3 -p petr-polyakov-kuber-sf --driver=docker # --mount-string="$(pwd)/src:/var/www/html" --mount-string="$(pwd)/db-init:/data/application"

# setting default and alias
minikube config set profile petr-polyakov-kuber-sf
# alias kubectl="minikube kubectl --"

# to try, method 2:
#  https://thospfuller.com/2020/12/09/learn-how-to-mount-a-local-drive-in-a-pod-in-minikube-2021/

# mounts
minikube mount $(pwd)/src:/var/www/html &!

minikube mount $(pwd)/db-init:/data/application &!

# adding objects from config
minikube kubectl -- apply -f configmap.yaml,secret.yaml,web.yaml,db.yaml

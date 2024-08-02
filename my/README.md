# My cluster setup

## The files

1. [configmap](./configmap.yaml)
2. [secret](./secret.yaml)
3. [db](./db.yaml)
4. [web](./web.yaml)

## Commands to run

```bash
# delete if exists
minikube delete -p petr-webapp

# create
minikube config set driver virtualbox
minikube kubectl -- get po -A
minikube start --nodes 3 -p petr-webapp --driver=virtualbox

# building
# docker build -t webapp ./dockerfiles/webapp.docker

# deploynment
kubectl apply -f configmap.yaml,secret.yaml,db.yaml,web.yaml
# or:
# minikube cache add <local image name>

# addons for dashboard
minikube -p petr-webapp addons enable metrics-server

# dashboard
minikube dashboard -p petr-webapp &!

# setting default profile & making alias
minikube config set profile petr-webapp
alias kubectl="minikube kubectl --"

# exposing service
# kubectl expose deployment/<deployment name> --type="NodePort" --port 8080 --cluster <cluster name>
kubectl expose deployment/petr-webapp-02 --type="NodePort" --port 8080 --cluster petr-webapp
```

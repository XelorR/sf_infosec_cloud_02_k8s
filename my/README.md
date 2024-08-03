# My cluster setup

## Current issues and questions to deal with

- [ ] Apache - access forbidden
- [ ] network, how should I specify database server in my php file?
- [ ] database initialization -- is /data/application/init.sql initialized on start?

## Files

1. [configmap](./configmap.yaml)
2. [secret](./secret.yaml)
3. [db](./db.yaml)
4. [web](./web.yaml)

## Commands to run

### Create container

```bash
# building and pushing to dockerhub
docker build -t xelorr/php-apache-mysqli -f ./dockerfiles/webapp.docker .
docker push xelorr/php-apache-mysql
```

### Create cluster

```bash
# delete if exists
minikube delete -p petr-webapp

# create
minikube config set driver docker
minikube kubectl -- get po -A
minikube start --nodes 3 -p petr-webapp --driver=docker
```

### Prepare cluster and launch dashboard

```bash
# run if exists
minikube start -p petr-webapp

# setup 
minikube config set profile petr-webapp
alias kubectl="minikube kubectl --"

# addons for dashboard
minikube -p petr-webapp addons enable metrics-server

# dashboard
minikube dashboard -p petr-webapp &!
```

### Building from config files

```bash
kubectl apply -f configmap.yaml,secret.yaml
cat web.yaml | sed "s|\.\/src|$(pwd)/src|" | kubectl apply -f -
cat db.yaml | sed "s|\.\/init.sql|$(pwd)/init.sql|" | kubectl apply -f -
```

### Launch webapp

```bash
# exposing service
# kubectl expose deployment/<deployment name> --type="NodePort" --port 8080 --cluster <cluster name>
# kubectl expose deployment/webapp-deployment --type="NodePort" --port 8880 --cluster petr-webapp
minikube service webapp-service
```

## Screenshots

![](./dashboard.png)

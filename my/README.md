# My cluster setup

## Current issues and questions to deal with

- [x] Apache - access forbidden... why? (wrongly specifyed address, no configs)
- [x] network, how should I specify database server in my php file? (have to use services and configmap)
- [x] database initialization -- is /data/application/init.sql initialized on start?
- [x] check if src folder mounted to webapp (mounted but empty)
- [x] check if init.sql mounted to maria (as folder... fixed)
- [x] `/data/application` is empty... why? (known issue, unable to fix quickly)
- [x] `/var/www/html` is empty... why? (known issue, unable to fix quickly)
- [x] what if I copy required files? How can I download config automatickly? (php works if i expose server)
- [x] which object from my configs can be threated as ip? Which name should i ping to confirm one pode avaliability from another? (service name, but it is not pingable)
- [ ] read about kubernetes network fundamentals
- [x] database not initiated, ensure running `mysqld --init-file /data/application/init.sql` on setup, mydb not available or try workaround: https://stackoverflow.com/questions/45681780/how-to-initialize-mysql-container-when-created-on-kubernetes#45682775
- [ ] repeat workaround for webapp, replacing hostmount with configmap, generated from php file

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

```bash
# creating configmaps from files
minikube kubectl -- create configmap maria-init --from-file=db-init/init.sql
minikube kubectl -- get configmaps maria-init -o yaml > maria-init-configmap.yaml

minikube kubectl -- create configmap php-app --from-file=src/index.php
minikube kubectl -- get configmaps php-app -o yaml > php-app-configmap.yaml
```

```bash
./rebuild-and-launch.sh

# dashboard
minikube -p petr-polyakov-kuber-sf addons enable metrics-server
minikube dashboard -p petr-polyakov-kuber-sf &!

# opening exposed service
minikube service webapp-service
```

```bash
# invintory
kubectl get all -o wide
```

### Get into the pod to inspect

```bash
./get-into-pod.sh maria-deployment
./get-into-pod.sh webapp-deployment
```

### Stop cluster

```bash
minikube stop -p petr-polyakov-kuber-sf
```

## Screenshots

![](./dashboard.png)

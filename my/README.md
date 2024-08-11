# My cluster setup

## Current issues and questions to deal with

- [ ] Apache - access forbidden... why?
- [ ] network, how should I specify database server in my php file?
- [x] database initialization -- is /data/application/init.sql initialized on start?
- [ ] database not initiated, ensure running `mysqld --init-file /data/application/init.sql` on setup, mydb not available
- [x] check if src folder mounted to webapp (mounted but empty)
- [x] check if init.sql mounted to maria (as folder... fixed)
- [ ] `/data/application` is empty... why?
- [ ] `/var/www/html` is empty... why?

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

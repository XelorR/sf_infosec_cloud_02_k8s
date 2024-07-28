# Пример приложения, предоставленный на курсе

1. [configmap](1_configmap.yaml)
2. [secret](2_mongo-secret.yaml)
3. [database](3_database.yaml)
4. [webapp](4_webapp.yaml)

## Как запустить сие

(дополняется)

```bash
# delete if exists
minikube delete -p skillfactory-tech

# create
minikube config set driver virtualbox
minikube kubectl -- get po -A
minikube start --nodes 3 -p skillfactory-tech --driver=virtualbox

# addons for dashboard
minikube -p skillfactory-tech addons enable metrics-server

# setting default profile
alias kubectl="minikube kubectl --"
minikube config set profile skillfactory-tech

# deploynment
kubectl apply -f 1_configmap.yaml,2_mongo-secret.yaml,3_database.yaml,4_webapp.yaml

# dashboard
minikube dashboard -p skillfactory-tech &!

#
minikube start -p skillfactory-tech
```

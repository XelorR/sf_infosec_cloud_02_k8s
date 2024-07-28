# Пример приложения, предоставленный на курсе

1. [configmap](1_configmap.yaml)
2. [secret](2_mongo-secret.yaml)
3. [database](3_database.yaml)
4. [webapp](4_webapp.yaml)

## Как запустить сие

(дополняется)

```bash
(
  HTTP_PROXY=http://127.0.0.1:2080

# delete if exists
  minikube delete -p skillfactory-tech

# create
  minikube config set driver virtualbox
  minikube kubectl -- get po -A
  minikube start --nodes 3 -p skillfactory-tech --driver=virtualbox

# setting default profile
  alias kubectl="minikube kubectl --"
  minikube config set profile skillfactory-tech

# deploynment
  kubectl apply -f 1_configmap.yaml,2_mongo-secret.yaml,3_database.yaml,4_webapp.yaml

# addons for dashboard
  minikube -p skillfactory-tech addons enable metrics-server

# dashboard
  minikube dashboard -p skillfactory-tech &!

# making alias
  minikube config set profile skillfactory-tech
  alias kubectl="minikube kubectl --"

)
```

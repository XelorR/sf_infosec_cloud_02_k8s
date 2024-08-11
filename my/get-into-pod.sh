#!/bin/bash

minikube kubectl -- exec $(minikube kubectl -- get pods | grep $1 | cut -d ' ' -f1) -it -- /bin/bash

#!/bin/bash


echo "=============================Add local storage============================================================="
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl get pods --all-namespaces
kubectl get storageclass
echo "Waiting for local storage to be ready ..."
  for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
      if sudo kubectl get pods --namespace=local-path-storage | grep Running ; then
        break
      fi
      sleep 5
done
kubectl get pods --all-namespaces
kubectl get pods --namespace=local-path-storage
kubectl get pods --all-namespaces # verify "*local-path-storage*" Running
echo "Waiting for Kubernetes to be ready ..."
  for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
      if [[ $( kubectl get pods --all-namespaces | awk '{print $1}') == "*local-path-storage*" ]] && [[ $( kubectl get pods --all-namespaces | awk '{print $2}') == "Running" ]] ; then
        break
      fi
      sleep 2
  done
kubectl get pods --all-namespaces # verify "*local-path-storage*" Running
echo "=============================Add local storage============================================================="

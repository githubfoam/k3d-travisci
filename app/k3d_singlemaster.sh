#!/bin/bash


echo "=============================k3d============================================================="
# - sudo sh -c "curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash" #grab the latest release
# - k3d version
# - k3d check-tools #Check if docker is running
# - sudo k3d --timestamp --verbose  create cluster --wait 360 --name demo --workers 4
# - docker ps
# - k3d list clusters
# - export KUBECONFIG="$(sudo k3d get-kubeconfig --name='demo')"
# - cat $KUBECONFIG
# - sudo kubectl get nodes
# - sudo kubectl get pod -o wide
# - sudo kubectl get pod -n kube-system -o wide
# - sudo kubectl get pod -n default -o wide
# - sudo kubectl get pods --all-namespaces
# - sudo kubectl get service --all-namespaces
# - sudo kubectl cluster-info
# curl: (60) SSL certificate problem: unable to get local issuer certificate
# - |
#   url="https://localhost:6443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy"
#   if curl --output /dev/null --silent --head --fail "$url"; then
#   echo "Metrics-server is running at $url"
#   else
#   echo "URL does not exist: $url"
#   fi
# - |
#   for i in {1..60}; do # Timeout after 5 minutes, 60x1=60 secs
#       if nc -z -v 127.0.0.1 6443 2>&1 | grep succeeded ; then
#         break
#       fi
#       sleep 5
#   done
# - kubectl get nodes --all-namespaces # verify "*helm-install-traefik-*"
# - |
#   for i in {1..60}; do # Timeout after 5 minutes, 60x7= 7 mins
#       if [[ $(sudo kubectl get nodes | awk '{print $1}') == "*helm-install-traefik-*" ]] && [[ $(sudo kubectl get nodes | awk '{print $4}') == "Running" ]]; then
#         break
#       fi
#       sleep 3
#   done
# - kubectl get nodes --all-namespaces # verify "*helm-install-traefik-*"
# - kubectl get pods --namespace=kube-system # verify namespace=kube-system Running
# - |
#   echo "Waiting for Kubernetes to be ready ..."
#   for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
#       if sudo kubectl get pods --namespace=kube-system | grep Running ; then
#         break
#       fi
#       sleep 2
#   done
# - kubectl get pods --namespace=kube-system # verify namespace=kube-system Running
# - sudo kubectl get nodes
# - sudo kubectl get pod -o wide
# - sudo kubectl get pod -n kube-system -o wide
# - sudo kubectl get pod -n default -o wide
# - sudo kubectl get pods --all-namespaces
# - sudo kubectl get service --all-namespaces
# - sudo kubectl cluster-info
# - echo "=============================Add local storage============================================================="
# - sudo kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
# - sudo kubectl get pods --all-namespaces
# - sudo kubectl get storageclass
# - |
#   echo "Waiting for local storage to be ready ..."
#   for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if sudo kubectl get pods --namespace=local-path-storage | grep Running ; then
#         break
#       fi
#       sleep 5
#   done
# - sudo kubectl get pods --all-namespaces
# - sudo kubectl get pods --namespace=local-path-storage
# -  kubectl get pods --all-namespaces # verify "*local-path-storage*" Running
# - |
#   echo "Waiting for Kubernetes to be ready ..."
#   for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
#       if [[ $(sudo kubectl get pods --all-namespaces | awk '{print $1}') == "*local-path-storage*" ]] && [[ $(sudo kubectl get pods --all-namespaces | awk '{print $2}') == "Running" ]] ; then
#         break
#       fi
#       sleep 2
#   done
# -  kubectl get pods --all-namespaces # verify "*local-path-storage*" Running
# - echo "=============================Add local storage============================================================="
# - echo "=============================openEBS============================================================="
# - sudo kubectl apply -f https://openebs.github.io/charts/openebs-operator.yaml #install OpenEBS
# - kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
# - kubectl get pods -n openebs -l openebs.io/component-name=openebs-localpv-provisioner #Observe localhost provisioner pod
# - kubectl get sc #Check the storage Class
# - |
#   echo "Waiting for openebs-localpv-provisioner to be ready ..."
#   for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if sudo kubectl get pods --namespace=openebs -l openebs.io/component-name=openebs-localpv-provisioner | grep Running ; then
#         break
#       fi
#       sleep 5
#   done
# - |
#     echo "Waiting for maya-apiserver component to be ready ..."
#     for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#         if sudo kubectl get pods --namespace=openebs -l openebs.io/component-name=maya-apiserver | grep Running ; then
#           break
#         fi
#         sleep 5
#     done
# - |
#     echo "Waiting for openebs-ndm component to be ready ..."
#     for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#         if sudo kubectl get pods --namespace=openebs -l openebs.io/component-name=openebs-ndm-operator | grep Running ; then
#           break
#         fi
#         sleep 5
#     done
# - |
#   echo "Waiting for openebs to be ready ..."
#   for i in {1..60}; do # Timeout after 2 minutes, 60x2=300 secs
#         if sudo kubectl get pods --namespace=openebs | grep Running ; then
#           break
#         fi
#         sleep 8
#   done
# - sudo kubectl get pods --all-namespaces
# - sudo kubectl get pods --namespace=openebs
# - echo "=============================openEBS============================================================="
###################### #Local Docker Registry ##################
# - echo "127.0.0.1 registry.local" |sudo tee -a /etc/hosts
# - sudo cat /etc/hosts
###################### #Local Docker Registry ##################
###################### #flask-helm-example ##################
# build and push docker image
# - pushd $(pwd) && cd flask-helm-example
# - docker build . -t flask-helm-example:latest --network host
# - docker tag flask-helm-example:latest registry.local:5000/flask-helm-example
# - sudo netstat -tlpen | grep 5000
# - docker push registry.local:5000/flask-helm-example
# # start the helm chart with local values
# - helm install flask-helm-example -f devvalues.yaml ./chart
# - sudo netstat -tlpen | grep 8080
# - - curl http://127.0.0.1:8080/flask-helm-example
# - curl http://localhost:8080/flask-helm-example
# - |
#   url="https://localhost:6443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy"
#   if curl --output /dev/null --silent --head --fail "$url"; then
#   echo "Metrics-server is running at $url"
#   else
#   echo "URL does not exist: $url"
#   fi
# - popd
###################### #flask-helm-example ##################
# - helm uninstall <name>
# - helm status <name>
#Setting up Helm
# - helm list
# - sudo kubectl -n kube-system create serviceaccount tiller
# - sudo kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
# - sudo helm init --service-account tiller
# - helm ls
# - helm repo update
# - helm search sonarqube
# - helm ls
# - sudo helm install stable/sonarqube --namespace sonar
# - helm ls
# - kubectl get pods -n sonarqube
# - kubectl get events
# # - kubectl exec -it sonar-sonarqube-6ff4554ff4-4f7p2 bash
# - helm list
###################### app1 ######################

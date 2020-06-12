
Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=dev)](https://travis-ci.com/githubfoam/k3d-travisci)  

~~~~
$ docker ps

CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                  PORTS                    NAMES

df531de0492e        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         1 second ago        Up Less than a second                            k3d-demo-worker-3

78870f35859b        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         2 seconds ago       Up 1 second                                      k3d-demo-worker-2

ff1005052a52        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         2 seconds ago       Up 1 second                                      k3d-demo-worker-1

5e0f8d74f456        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         3 seconds ago       Up 2 seconds                                     k3d-demo-worker-0

fae4a49a8e50        rancher/k3s:v1.17.3-k3s1   "/bin/k3s server --h…"   12 seconds ago      Up 10 seconds           0.0.0.0:6443->6443/tcp   k3d-demo-server

$ sudo kubectl get nodes

NAME                STATUS   ROLES    AGE   VERSION

k3d-demo-worker-0   Ready    <none>   12m   v1.17.3+k3s1

k3d-demo-worker-1   Ready    <none>   12m   v1.17.3+k3s1

k3d-demo-worker-2   Ready    <none>   12m   v1.17.3+k3s1

k3d-demo-worker-3   Ready    <none>   12m   v1.17.3+k3s1

k3d-demo-server     Ready    master   12m   v1.17.3+k3s1

$ sudo kubectl get pod -n kube-system -o wide

NAME                                      READY   STATUS      RESTARTS   AGE   IP          NODE                NOMINATED NODE   READINESS GATES

metrics-server-6d684c7b5-gnkrn            1/1     Running     0          12m   10.42.0.2   k3d-demo-worker-0   <none>           <none>

helm-install-traefik-5jqzd                0/1     Completed   1          12m   10.42.3.2   k3d-demo-worker-3   <none>           <none>

svclb-traefik-7h55q                       2/2     Running     0          12m   10.42.4.2   k3d-demo-server     <none>           <none>

svclb-traefik-wgpbc                       2/2     Running     0          12m   10.42.3.3   k3d-demo-worker-3   <none>           <none>

svclb-traefik-w59n7                       2/2     Running     0          12m   10.42.2.2   k3d-demo-worker-2   <none>           <none>

svclb-traefik-btwkr                       2/2     Running     0          12m   10.42.0.3   k3d-demo-worker-0   <none>           <none>

local-path-provisioner-58fb86bdfd-jdxh4   1/1     Running     0          12m   10.42.4.3   k3d-demo-server     <none>           <none>

svclb-traefik-4pg9p                       2/2     Running     0          12m   10.42.1.3   k3d-demo-worker-1   <none>           <none>

coredns-d798c9dd-5tj5x                    1/1     Running     0          12m   10.42.2.3   k3d-demo-worker-2   <none>           <none>

traefik-6787cddb4b-pgt87                  1/1     Running     0          12m   10.42.1.2   k3d-demo-worker-1   <none>           <none>

$ sudo kubectl get service --all-namespaces

NAMESPACE     NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE

default       kubernetes           ClusterIP      10.43.0.1       <none>        443/TCP                      12m

kube-system   kube-dns             ClusterIP      10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP       12m

kube-system   metrics-server       ClusterIP      10.43.135.73    <none>        443/TCP                      12m

kube-system   traefik-prometheus   ClusterIP      10.43.177.223   <none>        9100/TCP                     12m

kube-system   traefik              LoadBalancer   10.43.31.107    172.18.0.3    80:32170/TCP,443:31735/TCP   12m

$ sudo kubectl get pods --all-namespaces

NAMESPACE     NAME                                      READY   STATUS      RESTARTS   AGE

kube-system   metrics-server-6d684c7b5-gnkrn            1/1     Running     0          12m

kube-system   helm-install-traefik-5jqzd                0/1     Completed   1          12m

kube-system   svclb-traefik-7h55q                       2/2     Running     0          12m

kube-system   svclb-traefik-wgpbc                       2/2     Running     0          12m

kube-system   svclb-traefik-w59n7                       2/2     Running     0          12m

kube-system   svclb-traefik-btwkr                       2/2     Running     0          12m

kube-system   local-path-provisioner-58fb86bdfd-jdxh4   1/1     Running     0          12m

kube-system   svclb-traefik-4pg9p                       2/2     Running     0          12m

kube-system   coredns-d798c9dd-5tj5x                    1/1     Running     0          12m

kube-system   traefik-6787cddb4b-pgt87                  1/1     Running     0          12m
~~~~
add storage
~~~~
$ sudo kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
$ sudo kubectl get storageclass

NAME                   PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE

local-path (default)   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  12m
~~~~

~~~~
$ sudo kubectl get pods --all-namespaces

NAMESPACE            NAME                                      READY   STATUS      RESTARTS   AGE

kube-system          metrics-server-6d684c7b5-gnkrn            1/1     Running     0          12m

kube-system          helm-install-traefik-5jqzd                0/1     Completed   1          12m

kube-system          svclb-traefik-7h55q                       2/2     Running     0          12m

kube-system          svclb-traefik-wgpbc                       2/2     Running     0          12m

kube-system          svclb-traefik-w59n7                       2/2     Running     0          12m

kube-system          svclb-traefik-btwkr                       2/2     Running     0          12m

kube-system          local-path-provisioner-58fb86bdfd-jdxh4   1/1     Running     0          12m

kube-system          svclb-traefik-4pg9p                       2/2     Running     0          12m

kube-system          coredns-d798c9dd-5tj5x                    1/1     Running     0          12m

kube-system          traefik-6787cddb4b-pgt87                  1/1     Running     0          12m

local-path-storage   local-path-provisioner-8db6b8556-r6lwz    1/1     Running     0          6s


~~~~
~~~~
k3d is a utility designed to easily run K3s in Docker.
https://rancher.com/docs/k3s/latest/en/advanced/#running-k3d-k3s-in-docker-and-docker-compose

use the install script to grab the latest release:

    wget: wget -q -O - https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash
    curl: curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

use the install script to grab a specific release (via TAG environment variable):

    wget: wget -q -O - https://raw.githubusercontent.com/rancher/k3d/master/install.sh | TAG=v3.0.0-beta.0 bash
    curl: curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | TAG=v3.0.0-beta.0 bash

use Homebrew: brew install k3d (Homebrew is available for MacOS and Linux)

    Formula can be found in homebrew/homebrew-core and is mirrored to homebrew/linuxbrew-core



k3d create cluster CLUSTER_NAME to create a new single-node cluster (= 1 container running k3s)

Get the new cluster’s connection details merged into your default kubeconfig (usually specified using the KUBECONFIG environment variable or the default path $HOME/.kube/config) and directly switch to the new context:

k3d get kubeconfig mycluster --switch
kubectl get pods --all-namespaces
Use the new cluster with kubectl, e.g.:

kubectl get nodes
k3d delete cluster CLUSTER_NAME to delete the default cluster
https://github.com/rancher/k3d


troubleshooting

sudo k3d --timestamp --verbose  create cluster --wait 360 --name demo --api-port localhost:6444 --publish 8080:80 --server-arg --tls-san="127.0.0.1"  --workers 3 #Create a single- or multi-node k3s cluster in docker containers

kubectl config view
unset KUBECONFIG
lsof -i
~~~~

~~~~

Kubernetes storage
https://openebs.io

OpenZFS on Linux and FreeBSD
https://github.com/openzfs/zfs

Native ZFS on Linux
https://zfsonlinux.org/

https://k3s.io/

https://github.com/rancher/k3s

macOS Version
The default backend on macOS is hyperkit, wrapping Apple’s Hypervisor.framework
You need macOS Yosemite, version 10.10.3 or later installed on a 2010 or newer Mac
https://docs.travis-ci.com/user/reference/osx/#macos-version
~~~~

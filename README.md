
Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=master)](https://travis-ci.com/githubfoam/k3d-travisci)  

Travis (.com)   feature_ppc64le  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=feature_ppc64le)](https://travis-ci.com/githubfoam/k3d-travisci) 

Travis (.com)   feature_s390x  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=feature_s390x)](https://travis-ci.com/githubfoam/k3d-travisci) 

Travis (.com)   feature_windows  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=feature_windows)](https://travis-ci.com/githubfoam/k3d-travisci) 

Travis (.com)    feature_macos   branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=feature_macos)](https://travis-ci.com/githubfoam/k3d-travisci)

~~~~
$ docker ps

CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                  PORTS                    NAMES

28a416c4b37e        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         1 second ago        Up Less than a second                            k3d-demo-worker-3

04fe731e548c        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         2 seconds ago       Up Less than a second                            k3d-demo-worker-2

b715684dc118        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         2 seconds ago       Up 1 second                                      k3d-demo-worker-1

f3feec9d69a5        rancher/k3s:v1.17.3-k3s1   "/bin/k3s agent"         3 seconds ago       Up 2 seconds                                     k3d-demo-worker-0

188a66f83bbc        rancher/k3s:v1.17.3-k3s1   "/bin/k3s server --h…"   11 seconds ago      Up 9 seconds            0.0.0.0:6443->6443/tcp   k3d-demo-server
~~~~
~~~~
$ k3d list clusters

+------+------------------------------------+---------+---------+

| NAME |               IMAGE                | STATUS  | WORKERS |

+------+------------------------------------+---------+---------+

| demo | docker.io/rancher/k3s:v1.17.3-k3s1 | running |   4/4   |

+------+------------------------------------+---------+---------+

$ sudo kubectl get nodes

NAME                STATUS   ROLES    AGE     VERSION

k3d-demo-server     Ready    master   7m14s   v1.17.3+k3s1

k3d-demo-worker-0   Ready    <none>   7m11s   v1.17.3+k3s1

k3d-demo-worker-1   Ready    <none>   7m9s    v1.17.3+k3s1

k3d-demo-worker-3   Ready    <none>   7m9s    v1.17.3+k3s1

k3d-demo-worker-2   Ready    <none>   7m8s    v1.17.3+k3s1

$ sudo kubectl get pods --all-namespaces

NAMESPACE            NAME                                      READY   STATUS      RESTARTS   AGE

kube-system          coredns-d798c9dd-js8b5                    1/1     Running     0          7m6s

kube-system          local-path-provisioner-58fb86bdfd-dxwfm   1/1     Running     0          7m6s

kube-system          metrics-server-6d684c7b5-7qnvd            1/1     Running     0          7m6s

kube-system          helm-install-traefik-9brf9                0/1     Completed   2          7m5s

kube-system          svclb-traefik-49stj                       2/2     Running     0          6m28s

kube-system          svclb-traefik-7xx69                       2/2     Running     0          6m28s

kube-system          svclb-traefik-rg75h                       2/2     Running     0          6m28s

kube-system          svclb-traefik-rjb5m                       2/2     Running     0          6m28s

kube-system          svclb-traefik-fc6pw                       2/2     Running     0          6m28s

kube-system          traefik-6787cddb4b-zfbqv                  1/1     Running     0          6m29s

local-path-storage   local-path-provisioner-8db6b8556-j2f7w    1/1     Running     0          5s


$ sudo kubectl get pod -n kube-system -o wide

NAME                                      READY   STATUS      RESTARTS   AGE     IP          NODE                NOMINATED NODE   READINESS GATES

local-path-provisioner-58fb86bdfd-7wx8k   1/1     Running     0          7m2s    10.42.2.2   k3d-demo-worker-0   <none>           <none>

metrics-server-6d684c7b5-cjw9l            1/1     Running     0          7m2s    10.42.4.2   k3d-demo-worker-3   <none>           <none>

coredns-d798c9dd-9cqtf                    1/1     Running     0          7m2s    10.42.0.2   k3d-demo-worker-2   <none>           <none>

helm-install-traefik-5gcv7                0/1     Completed   2          7m2s    10.42.3.2   k3d-demo-worker-1   <none>           <none>

svclb-traefik-pq5df                       2/2     Running     0          6m36s   10.42.3.3   k3d-demo-worker-1   <none>           <none>

svclb-traefik-xlvp7                       2/2     Running     0          6m36s   10.42.4.3   k3d-demo-worker-3   <none>           <none>

svclb-traefik-9xhw2                       2/2     Running     0          6m36s   10.42.2.3   k3d-demo-worker-0   <none>           <none>

svclb-traefik-tvmwb                       2/2     Running     0          6m36s   10.42.0.3   k3d-demo-worker-2   <none>           <none>

svclb-traefik-7p58r                       2/2     Running     0          6m36s   10.42.1.2   k3d-demo-server     <none>           <none>

traefik-6787cddb4b-tmx42                  1/1     Running     0          6m36s   10.42.1.3   k3d-demo-server     <none>           <none>


$ sudo kubectl get service --all-namespaces

NAMESPACE     NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE

default       kubernetes           ClusterIP      10.43.0.1       <none>        443/TCP                      7m18s

kube-system   kube-dns             ClusterIP      10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP       7m16s

kube-system   metrics-server       ClusterIP      10.43.0.179     <none>        443/TCP                      7m16s

kube-system   traefik-prometheus   ClusterIP      10.43.39.87     <none>        9100/TCP                     6m37s

kube-system   traefik              LoadBalancer   10.43.225.245   172.18.0.2    80:32297/TCP,443:30385/TCP   6m37s


$ sudo kubectl cluster-info

Kubernetes master is running at https://localhost:6443

CoreDNS is running at https://localhost:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

Metrics-server is running at https://localhost:6443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy
~~~~

~~~~
#Add local storage
- sudo kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
- sudo kubectl get pods --all-namespaces
- sudo kubectl get storageclass

$ sudo kubectl get pods --all-namespaces

NAMESPACE            NAME                                      READY   STATUS      RESTARTS   AGE

kube-system          local-path-provisioner-58fb86bdfd-dxwfm   1/1     Running     0          7m6s
local-path-storage   local-path-provisioner-8db6b8556-j2f7w    1/1     Running     0          5s
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

https://github.com/rancher/k3d

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

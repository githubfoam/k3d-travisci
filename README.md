
Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/k3d-travisci.svg?branch=dev)](https://travis-ci.com/githubfoam/k3d-travisci)  



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

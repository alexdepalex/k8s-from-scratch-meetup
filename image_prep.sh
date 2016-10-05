#!/bin/bash

docker pull gcr.io/google_containers/hyperkube:v1.4.0
docker pull weaveworks/weave-kube:latest
docker pull weaveworks/weave-npc:latest
docker pull weaveworks/plugin:1.7.0
docker pull weaveworks/weaveexec:1.7.0
docker pull weaveworks/weave:1.7.0
docker pull weaveworks/weavedb

curl -L -o /opt/bin/kubelet -z /opt/bin/kubelet https://storage.googleapis.com/kubernetes-release/release/v1.4.0/bin/linux/amd64/kubelet
curl -L -o /opt/bin/kubectl -z /opt/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.4.0/bin/linux/amd64/kubectl
curl -L -o /opt/bin/kube-proxy -z /opt/bin/kube-proxy https://storage.googleapis.com/kubernetes-release/release/v1.4.0/bin/linux/amd64/kube-proxy

chmod +x /opt/bin/*

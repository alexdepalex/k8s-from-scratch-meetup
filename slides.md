<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/gamification.jpg)" data-background-size="cover" data-background-position="center" -->
# Kubernetes from scratch<br/>
# <span style='font-size:0.9em'>How to run kube on almost any IaaS</span>
<br />
<br />
<div style="width: 200px; margin-bottom: -500px; margin-left: -200px;">
  <img src="img/xebia.svg" />
</div>

!SLIDE
Fai Fung Cloud Engineer at **Xebia**.

Eric Nieuwenhuijsen Cloud Engineer at **Xebia**.

Thomas Kruitbosch DevOps Consultant at **Xebia**.

!NOTE
- to be added, intro

!SLIDE
**Kubernetes** concepts!


!SUB
Kubelet, leuk proces

!SUB
Kube-proxy

!SUB
* API server
* Controller Manager
* ETCD

!SLIDE
**Whats'up?** Kubernetes, Kubernetes, Kubernetes.

We have prepared the specification of the IAAS layer (on AWS) for you.

!NOTE
- to be added

!SLIDE
**Kubernetes setup the easy way!**

A simple tutorial to setup Kubernetes on a Vagrant cluster

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)

!SLIDE
**A successful installation and setup of Kubernetes?**

However, a blackbox setup, what about troubleshooting, a more customized setup, etc

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)

Troubleshooting (mac os):

```dyld: Library not loaded: /vagrant-substrate/staging/embedded/lib/libssl.1.0.0.dylib
  Referenced from: /opt/vagrant/embedded/bin/openssl
  Reason: image not found
  ```

ensure openssl is installed
workaround: sudo ln -sf /usr/local/bin/openssl /opt/vagrant/embedded/bin/openssl

!SLIDE
**Kubernetes setup the HARD way!**

Kubernetes is working, what about the actual setup

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)

!SLIDE
**Follow along**

verhaaltje over follow along

!SUB
*First start the box*
On your own host, type:
```
vagrant up
```

*Verify the host is up*
```
ping ip.adres.
```

!SUB
*Now SSH into the master*
```
vagrant ssh
```

!SUB
*Verify cluster health*
`etcdctl cluster-health`

!SUB
PAUZE

!SUB
*Start Kubelet on the Master*
```
sudo /opt/bin/kubelet \
--api-servers=http://${k8s-apiserver-fqdn}:8080 \
--healthz-bind-address=0.0.0.0 \
--config=/etc/kubernetes/manifests \
--network-plugin=cni \
--network-plugin-dir=/etc/cni/net.d \
--allow-privileged=true
```

!SUB
*Verify that the master is visible*
```
kubectl get nodes
```

!SUB
*START Kubelet on the workers*
```
ssh core@k8snode0 "sudo /opt/bin/kubelet \
--api-servers=http://${k8s-apiserver-fqdn}:8080 \
--healthz-bind-address=0.0.0.0 \
--config=/etc/kubernetes/manifests \
--network-plugin=cni \
--network-plugin-dir=/etc/cni/net.d \
--allow-privileged=true"
```

!SUB
*Verify that all three nodes are visible*
```
kubectl get nodes
```

!SUB
*Schedule weave*
```
kubectl create -f /path/to/weave.yml
```

!SUB
*Verify weave status*
```
weave status peers
```

!SUB
*Schedule app*
```
kubectl create -f /path/to/app.yml
```

!SUB
*View the app*
Open your browser to http://bla.bla

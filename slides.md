<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/gamification.jpg)" data-background-size="cover" data-background-position="center" -->
# Kubernetes from scratch<br/>
# <span style='font-size:0.9em'>How to run kube on almost any IaaS</span>
<br />
<br />
<div style="width: 200px; margin-bottom: -500px; margin-left: -200px;">
  <img src="img/xebia.svg" />
</div>

!SLIDE
Today's **goal**
<br/>
<br/>
Running a kubernetes cluster on 3 hosts

!SUB
About **you**

!SUB
About **us**
<br/>
<br/>
Fai Fung Copy-Paste Wizard at **Xebia**.

Eric Nieuwenhuijsen Cloud Engineer at **Xebia**.

Thomas Kruitbosch DevOps Consultant at **Xebia**.

!NOTE
- to be added, intro

!SLIDE
Today's **Setup**
<br/>
<br/>
<center>
  <img src="img/setup-vagrant-machines.png" style="width: 70%;" />
</center>

!SLIDE
**Kubernetes** concepts!
<br/>
<br/>
<center>
  <img src="img/k8s-arch-overview.png" style="width: 70%;" />
</center>

!SUB
Kubelet, leuk proces

!SUB
Kube-proxy

!SUB
* API server
* Controller Manager
* ETCD

!SLIDE
**Kubernetes** concepts: Kubelet, Service Proxy, Pods
<br/>
<br/>
<center>
  <img src="img/k8s-arch-kubelets-service-pods.png" style="width: 70%;" />
</center>

!SLIDE
**Kubernetes** concepts: API server, Controller Manager, etcd
<br/>
<br/>
<center>
  <img src="img/k8s-arch-api-cm-scheduler.png" style="width: 70%;" />
</center>

!SLIDE
**Weave** overlay network
<br/>

- Weave allows you to connect docker containers across multiple hosts together
- it gives you a flat network for your container environment independent of which host they are located (AWS, GCE, Azure, etc.)

<br/>
<center>
  <img src="img/weave.png" style="width: 70%;" />
</center>

!SLIDE
**Whats'up?** Kubernetes, Kubernetes, Kubernetes.

We have prepared the specification of the IAAS layer (on AWS) for you.

!NOTE
- to be added

!SLIDE
**Kubernetes setup the easy way!**

Ensure have virtualBox, vagrant working including 'vagrant ssh' access. For windows users, follow this blog if 'vagrant ssh' is not working [blog](http://tech.osteel.me/posts/2015/01/25/how-to-use-vagrant-on-windows.html)  

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
```
etcdctl cluster-health
```

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

!SLIDE
*Production readiness*
- SSL certs for ETCD/communication
- Multi master setup

!SUB
*Changes made to vagrant image* <br />
Our vagrant boxes are based on the default [CoreOS](https://github.com/coreos/coreos-vagrant.git) images<br />
- Unit files for kubernetes added
- YAML files for Weave and Application
- Preloaded containers
 - Hyperkube
 - Weave
- Preloaded binaries
 - kubectl
 - kubelet
 - kube-proxy

!SLIDE
*Questions?*

!SLIDE
***BEER***

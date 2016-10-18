<div style="width: 100%; margin-top: -300px;">
<center>
  <img src="img/k8s.png" style="width: 40%;" />
</center>
</div>
<br />
<br />
<center>
**Kubernetes from scratch**
<br />
*How to run kube on almost any IaaS*
<br />
</center>
<div style="width: 200px; margin-bottom: -500px; margin-left: -180px;">
  <img src="img/xebia-purple.png" />
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
**Fai Fung**: Copy-Paste Wizard at **Xebia**.

**Eric Nieuwenhuijsen**: Cloud Engineer at **Xebia**.

**Thomas Kruitbosch**: DevOps Wise guy at **Xebia**.

!SUB
**Schedule**

- 18:00 Reception
- 18:30 Food served
- 19:00 Kubernetes from scratch part 1: introduction
- 19:30 Break
- 19:45 Kubernetes from scratch part 2: type-along
- 20:30 Drinks


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
**Kubernetes** concepts introduction
<br/>
<br/>
The Kubernetes concepts slide shows the architecture followed by Kubernetes. It displays the following key components:

- API server exposes services which can be by other components. The API server is stateless. APIs can be accessed using the kubectl command line interface (CLI) or using AJAX.
- Individual Kubelet processes run on each physical machine which is used to manage pods (see sub slides of next slides [navigation: right, down] on its system.
- All persistent master state is stored in an instance of etcd. etcd is a distributed key-value store
- Furthermore, a scheduler is used to schedule pods onto machines based on a scheduling algorithm.
- Finally, the controller manager performs cluster level controller functions.

!SLIDE
**Kubernetes** concepts: Kubelet, Service Proxy, Pods
<br/>
<br/>
<center>
  <img src="img/k8s-arch-kubelets-service-pods.png" style="width: 70%;" />
</center>

!SUB
**Worker node (1):** Kubelet and Pods
<br/>
<br/>
**Kubelet**
The kubelet manages pods and their containers, their images, their volumes, etc. Kubelet is a service installed on the worker nodes. It reads container manifests as YAML files that describes a pod. Kubelet ensures that the containers defined in the pods are started and continue running.
<br/>
<br/>
**Pods**
A pod is a group of one or more containers (such as Docker containers), the shared storage for those containers, and options about how to run the containers. Pods are always co-located and co-scheduled, and run in a shared context. It contains one or more application containers which are relatively tightly coupled.

!SUB
**Worker node (2):** Kube-proxy (aka service proxy)
<br/>
<br/>
**kube-proxy**
The Kubernetes network proxy runs on each node. This reflects services as defined in the Kubernetes API on each node and can do simple TCP,UDP stream forwarding or round robin TCP,UDP forwarding across a set of backends.
Services typically contain one or more pods. A service gets a known static IP address, DNS name etc. It helps us achieve tasks like configuration and reference.

!SLIDE
**Kubernetes** concepts: API Server, Controller Manager, etcd
<br/>
<br/>
<center>
  <img src="img/k8s-arch-api-cm-scheduler.png" style="width: 70%;" />
</center>

!SUB
**API server**
<br/>
The apiserver serves up the Kubernetes API. It is intended to be a CRUD-y server, with most/all business logic implemented in separate components or in plug-ins. It mainly processes REST operations, validates them, and updates the corresponding objects in etcd (and eventually other stores).
<br/>
<br/>
**Scheduler**
A scheduler is used to schedule pods onto machines based on a scheduling algorithm. The scheduler is responsible for tracking resource utilization on each host to make sure that workloads are not scheduled in excess of the available resources.

!SUB
**Controller Manager**
<br/>
Cluster-level functions are performed by the Controller Manager. For instance, Endpoints objects are created and updated by the endpoints controller, and nodes are discovered, managed, and monitored by the node controller.

The controller manager watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller.

!SUB
**etcd**
<br/>
All persistent master state is stored in an instance of etcd. This provides a great way to store configuration data reliably. With watch support, coordinating components can be notified very quickly of changes.

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
**Where do we start Today?**

- We have prepared the specification of the IAAS layer for you.
- When prepared, you have a IaaS layer running (a healthy three nodes cluster)

<br/>
<br/>
**If you want more groundwork:**

- [*Kubernetes Installation with Vagrant & CoreOS*](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)
- [*Kubernetes The Hard Way, tutorial by Kelsey Hightower*](https://github.com/kelseyhightower/kubernetes-the-hard-way)


!SLIDE
**Follow along**<br/>

Today we'll be doing a follow along style presentation. All commands shown in these slides will be executed on the projector and the output will be shown <br /> <br /> You can execute the commands at the same time on your own laptop or try them at your own pace at a later time.<br /> <br />
View the slides at https://xebia.github.io/k8s-from-scratch-meetup/

!SUB
*First start the box*<br/>
On your own host in the coreos subdirectory of the repository type:
```
vagrant up
```
Verify the host is up
```
ping 172.17.8.101
```

!SUB
*Now SSH into the master*
```
vagrant ssh core-01
```
Your prompt should look similar to this
```
CoreOS stable (1122.2.0)
Last login: Mon Oct 17 18:58:01 2016 from 10.0.2.2
core@core-01 ~ $
```

!SUB
*Verify cluster health*
```
etcdctl cluster-health
```
This should return a prompt like this
```
core@core-01 ~ $ etcdctl cluster-health
member 25d6ce33763c5524 is healthy: got healthy result from http://172.17.8.102:2379
member 6ae27f9fa2984b1d is healthy: got healthy result from http://172.17.8.101:2379
member ff32f4b39b9c47bd is healthy: got healthy result from http://172.17.8.103:2379
cluster is healthy
```

!SLIDE
PAUZE

!SUB
<!-- .slide: data-background-color="var(--black)" data-background="url(img/containerday.jpg)" -->
<center>
<h2>Dutch Container Day</h2>
<p><font color="white">November 17th - Wibautstraat 200 Amsterdam</font></p>
<br/ >
<br />
<br/ >
<p><font color="white">Special discount for Dutch Devops Engineers!</font></p>
<p><b><font color="white">33% discount code: kubernetes-from-scratch </font></b></p>
 <p><font color="white">(only valid today!)</font></p>
</center>


!SLIDE
*First the kubelet*
```
sudo /opt/bin/kubelet \
--api-servers=http://172.17.8.101:8080 \
--healthz-bind-address=0.0.0.0 \
--config=/etc/kubernetes/manifests \
--network-plugin=cni \
--node-ip=172.17.8.101 \
--network-plugin-dir=/etc/cni/net.d \
--allow-privileged=true
```

!SUB
*To daemonize the process we use systemd*
```
sudo systemctl start kube-kubelet
```

!SUB
*Follow the log output to see kubelet starting up*
```
journalctl -fu kube-kubelet
```
Press CTRL-C to cancel following the log

!SUB
*Verify that the master is visible*
```
kubectl get nodes
```
This should show the following result
```
core@core-01 ~ $ kubectl get nodes
NAME      STATUS    AGE
core-01   Ready     1m
```

!SUB
*Start the Kubelet on the workers*
```
vagrant ssh core-02
core@core-02 ~ $ sudo systemctl start kube-kubelet

vagrant ssh core-03
core@core-03 ~ $ sudo systemctl start kube-kubelet
```

!SUB
*Verify that all three nodes are visible*
```
kubectl get nodes
```
This should show the following result
```
core@core-01 ~ $ kubectl get nodes
NAME      STATUS    AGE
core-01   Ready     2m
core-02   Ready     1m
core-03   Ready     1m
```

!SLIDE
*Next up is the proxy*
```
sudo /opt/bin/kube-proxy \
--master=http://172.17.8.101:8080 \
--logtostderr=true \
--masquerade-all
```

!SUB
*To daemonize the process we use systemd*
```
sudo systemctl start kube-proxy
```

!SUB
*Check the log output*
```
journalctl -fu kube-proxy
```
Press CTRL-C to cancel following the log

!SUB
*Start the kube-proxy on the workers*
```
vagrant ssh core-02
core@core-02 ~ $ sudo systemctl start kube-proxy

vagrant ssh core-03
core@core-03 ~ $ sudo systemctl start kube-proxy
```

!SLIDE
*Schedule weave*
```
kubectl create -f https://git.io/weave-kube
```
This should give the following result
```
core@core-01 ~ $ kubectl create -f https://git.io/weave-kube
daemonset "weave-net" created
```

!SUB
*Verify the deployment*
```
kubectl get pods --namespace="kube-system"
```
This should show a result like this
```
core@core-01 ~ $ kubectl get pods --namespace="kube-system"
NAME                              READY     STATUS    RESTARTS   AGE
kube-apiserver-core-01            1/1       Running   0          5m
kube-controller-manager-core-01   1/1       Running   0          5m
kube-scheduler-core-01            1/1       Running   0          5m
weave-net-4bk9o                   2/2       Running   0          1m
weave-net-nor9v                   2/2       Running   0          1m
weave-net-v67qy                   2/2       Running   0          1m
```

!SUB
*Verify the weave status*
```
weave status peers
```

!SUB
*Weave status peers should display a list of peers*
```
core@core-01 ~ $ weave status peers
0a:e1:07:a9:14:92(core-03)
   -> 172.17.8.101:6783     32:1b:2d:1b:d1:e0(core-01)            established
   <- 172.17.8.102:42173    0a:4e:1e:1a:69:db(core-02)            established
0a:4e:1e:1a:69:db(core-02)
   -> 172.17.8.101:6783     32:1b:2d:1b:d1:e0(core-01)            established
   -> 172.17.8.103:6783     0a:e1:07:a9:14:92(core-03)            established
32:1b:2d:1b:d1:e0(core-01)
   <- 172.17.8.103:40977    0a:e1:07:a9:14:92(core-03)            established
   <- 172.17.8.102:45731    0a:4e:1e:1a:69:db(core-02)            established
```

!SUB
*Now install the CNI loopback binary*
```
vagrant ssh core-01
core@core-01 ~ $ sudo /bin/sh -c \
	'curl -L \
	https://github.com/containernetworking/cni/releases/download/v0.3.0/cni-v0.3.0.tgz | \
	tar xvzC /opt/cni/bin ./loopback'

vagrant ssh core-02
core@core-02 ~ $ sudo /bin/sh -c \
	'curl -L \
	https://github.com/containernetworking/cni/releases/download/v0.3.0/cni-v0.3.0.tgz | \
	tar xvzC /opt/cni/bin ./loopback'

vagrant ssh core-03
core@core-03 ~ $ sudo /bin/sh -c \
	'curl -L \
	https://github.com/containernetworking/cni/releases/download/v0.3.0/cni-v0.3.0.tgz | \
	tar xvzC /opt/cni/bin ./loopback'
```

!SLIDE
*Schedule the demoapp*
```
kubectl run my-nginx --image=nginx --replicas=2 --port=80
kubectl expose deployment my-nginx --target-port=80 --port=8080 --type=NodePort
```
Verify the deployment
```
core@core-01 ~ $ kubectl get pods
NAME                       READY     STATUS    RESTARTS   AGE
my-nginx-392870844-rr6ox   1/1       Running   0          2m
my-nginx-392870844-ttq7m   1/1       Running   0          2m
```

!SUB
*Find the port on which the service was scheduled*
```
core@core-01 ~ $ kubectl get -o yaml service/my-nginx | grep nodePort
  - nodePort: 25467
```
View the app by going to
```
http://172.17.8.101:*NODEPORT*
```
Substitute NodePort with the port you found using the first command

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

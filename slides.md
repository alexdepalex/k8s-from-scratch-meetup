<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/gamification.jpg)" data-background-size="cover" data-background-position="center" -->
# Kubernetes from scratch<br/>
# building a Kubernetes cluster from scratch
<br />
<br />
<div style="width: 200px; margin-bottom: -500px; margin-left: -200px;">
  <img src="/img/xebia.svg" />
</div>

!SLIDE
Fai Fung Cloud engineer at **Xebia**.

Erik Nieuwenhuijsen Cloud engineer at **Xebia**.

Thomas Kruitbosch DevOps Consultant at **Xebia**.

!NOTE
- to be added, intro

!SLIDE
**Kubernetes** concepts!

!NOTE
- to be added

!SLIDE
**Whats'up?** Kubernetes, Kubernetes, Kubernetes.

We have prepared the specification of the IAAS layer (on AWS) for you. 

!NOTE
- to be added


!SLIDE
**Kubernetes setup the easy way!** 

A simple tutorial to setup Kubernetes on a Vagrant cluster

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)

!NOTE
- Quick way to use and experiment with vagrant

!SLIDE
**A successful installation and setup of Kubernetes?** 

However, a blackbox setup, what about troubleshooting, a more customized setup, etc

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)

Troubleshooting (mac os):

```dyld: Library not loaded: /vagrant-substrate/staging/embedded/lib/libssl.1.0.0.dylib
  Referenced from: /opt/vagrant/embedded/bin/openssl
  Reason: image not found```

ensure openssl is installed
workaround: sudo ln -sf /usr/local/bin/openssl /opt/vagrant/embedded/bin/openssl

!SLIDE
**Kubernetes setup the HARD way!** 

Kubernetes is working, what about the actual setup

hands-on: [Kubernetes Installation with Vagrant & CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html)


!SLIDE
Install kubectl on your machine

for mac:

```curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/darwin/amd64/kubectl```

!NOTE
- which of these technologies do you buy in to?
- will your knowledge still matter next year?
- what if you make the wrong decision?



!SLIDE
1. We start working on the **new platform**

2. The **old platform** starts catching on **fire**

3. They frantically **fix** the **old platform**

4. We have to continue **developing** the **new platform**

5. The **knowledge gap widens**

6. Rinse & **repeat**


!NOTE
- but it gets better
- very reminiscent of a book i've read

!SLIDE
Everything needs to be in the **cloud** before the **end of the year**! But the **team** is getting **smaller** and it's summer holiday season.

The old platform is **still breaking** left and right, and we have **3 months left**.
<center>
  <img src="/img/phoenix.png" style="width: 70%;" />
</center>

!NOTE
- in the cloud before end of year
- grexit
- feature request galore
- summer holidays
- firefighting
- we're leaving in 3 months
- what now?

!SLIDE
<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/doom.jpg)" data-background-size="cover" -->
# Are we DOOMed?

!SLIDE
<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/hashiconf.jpg)" data-background-size="cover" data-background-position="center" -->

!NOTE
- helping hashicorp organise hashiconf
- how could we showcase the tools in a hands-on way?
- make it competitive!

!SLIDE
technical diagram.... WIP!!!!

!NOTE
- 3 hectic long days
- checker simple but powerful, can check solution automatically
- don't expose the checker to the outside world
- spin up infra with terraform on google cloud
- each contestant within a minute! (very impressive)

!SLIDE
You score **points** by **completing** data center automation focused **challenges** on Vault, Nomad, Consul and Terraform.

!NOTE
- everything was pre-configured
- contestants focus on using the tools vs. setup
- if solved, press button and automatically checked
- solved = points on leaderboard
- leaderboard per tool and overall

!SLIDE
People got really into it, even the **pros**. One participant even **missed the first day of talks**, because he too busy **finishing the challenges**.
<center>
  <img src="/img/final_contest.png" style="width: 50%; float: left;" />
  <img src="/img/armon_seth.png" style="width: 50%; float: left;" />
</center>

!SLIDE
Surprised how **big an impact** the tool has, and how **efficient** and **interactive** this way of **learning new technologies** and accompanying **concepts** it is.

!NOTE
- feedback was amazing
- learning new tools through the challenges
- asked if they could use it internally to teach employees
- asked if they could use it as assessment tool
- done the challenge at meetups
- feedback always same: great way to learn new tools

!SLIDE
How can we **apply** this to **learning** and **transferring knowledge**?

<br />
<center>
  <img src="/img/joust.png" style="box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); border-radius: 5px;"/>
</center>

!NOTE
- started creating challenges at my project for docker, consul, etc.
- teaches both the creator and the contestant
- challenges can teach even after we are gone
- can assess new employees

!SLIDE
- Gives you a **manageable** set of **tasks** and **subtasks**

- You can safely **learn from mistakes**

- There is **attention for achievements**

- You get to **explore other roles**

- It **directs** and **motivates** you when learning new things

!SLIDE
<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/quote.jpg)" data-background-size="cover" data-background-position="center" -->
# &ldquo; Tell me, I will forget.<br />
# Show me, I may remember.<br />
# Involve me, I will understand &rdquo;

!SLIDE
Gamification gives learners the **boost in motivation** they need to become **active participants** in the learning process.

It also serves as an **incentive** for those who may be more **competitive in nature**.

!SLIDE
<center>
<span style="font-size: 128px;">**75%**</span><br />
psychology
<br />
<br />
<br />
<br />
<span style="font-size: 128px;">**25%**</span><br />
technology
</center>

!NOTE
- not all about fun
– not all about technology either

!SLIDE
- **79%** says gamification makes them **more productive**.

- **14% higher** in **skill based** assessments

- **11% higher** in terms of **factual knowledge**

- **9% increase** in **retention rates**

<br />
<span style="display: block; font-size: 16px; font-style: italic; color: #999999; text-align: right; width: 100%;">Gamification survey results by TalentLMS</span>

!SLIDE
- **Multiplayer**, either cooperative or versus

- Turn based **chaos monkey** destroying each others infrastructure?

- **Branching scenarios** where your choices impact your future

- Playing out **real scenarios**, based on real environments

- Teach **cultural subjects** such as DevOps

- Learn from others by **sharing solutions** and watching replays

!NOTE
- so much more we can do

!SLIDE
<!-- .slide: data-background-color="var(--mainColor)" data-background="url(/img/future.png)" data-background-size="cover" data-background-position="center" -->
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
# Where next?

!SLIDE
challenge for hashiconf announcements will be open after the event.

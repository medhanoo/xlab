#!/bin/bash

#Installing runtime

docker_install() {

apt-get update


apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -


add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#sudo apt-get install -y docker-ce docker-ce-cli containerd.io
apt-get install -y containerd.io
containerd config default > /etc/containerd/config.toml

cat > /etc/docker/daemon.json <<EOF
	{
	  "exec-opts": ["native.cgroupdriver=systemd"],
	  "log-driver": "json-file",
	  "log-opts": {
		"max-size": "1m"
	  }
	}
EOF

mkdir -p /etc/systemd/system/docker.service.d


systemctl daemon-reload
systemctl restart docker

}


k8s_install() {

apt-get install -y linux-modules-5.15.0-58-generic
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update

apt-get install -y  kubeadm=1.26.0-00 kubelet=1.26.0-00 kubectl=1.26.0-00


sudo apt-mark hold kubelet kubeadm kubectl

}


docker_install
k8s_install

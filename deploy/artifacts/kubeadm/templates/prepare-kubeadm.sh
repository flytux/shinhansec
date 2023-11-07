#!/bin/sh

# Disble SELINUX 
setenforce 0
sed -i --follow-symlinks 's/SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

# Install containerd
rpm -Uvh kubeadm/rpms/*.rpm --force

systemctm enable containerd 

rm /etc/containerd/config.toml

systemctl restart containerd

cp kubeadm/kubernetes/bin/* /usr/local/bin
chmod +x /usr/local/bin/*
cp -R kubeadm/cni /opt

# Load kubeadm container images
#nerdctl load -i kubeadm/images/kubeadm.tar

# Configure and start kubelet
cp kubeadm/kubernetes/config/kubelet.service /etc/systemd/system
mv kubeadm/kubernetes/config/kubelet.service.d /etc/systemd/system

systemctl daemon-reload
systemctl enable kubelet --now

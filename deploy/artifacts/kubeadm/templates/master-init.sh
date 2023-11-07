# 01 init cluster 
modprobe br_netfilter
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

PATH=/usr/local/bin:$PATH
MASTER_IP=$(hostname -I)
kubeadm init --pod-network-cidr=192.168.0.0/16 --upload-certs --control-plane-endpoint=$(echo $MASTER_IP):6443 | \
sed -e '/kubeadm join/,/--certificate-key/!d' | head -n 3 > join_cmd
# 02 copy kubeconfig
mkdir -p $HOME/.kube
cp -ru /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# 03 install cni
kubectl create -f kubeadm/cni/calico.yaml

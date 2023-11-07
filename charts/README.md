kubectl taint nodes --all  node-role.kubernetes.io/control-plane-


k edit deploy -n ingress-nginx ingress-nginx-controller
---
template:
  spec:
    hostNetwork: true
---

helm upgrade -i rancher rancher/rancher-2.7.8.tgz --set hostname=rancher.shinhansec.com --set bootstrapPassword=admin --set replicas=1 --set global.cattle.psp.enabled=false --create-namespace -n cattle-system

istio-init error

modprobe br_netfilter ; modprobe nf_nat ; modprobe xt_REDIRECT ; modprobe xt_owner; modprobe iptable_nat; modprobe iptable_mangle; modprobe iptable_filter

variable "password" { default = "linux" }

variable "network_name" { default = "nat101" }

variable "prefix_ip" { default = "101.10.10" }

variable "master_ip" { default = "101.10.10.101" }

variable "network_domain_name" { default = "kubeworks.net" }

variable "cloud_image_name" { default = "Rocky-8-GenericCloud-8.6.20220702.0.x86_64.qcow2" }
  
variable "disk_pool" { default = "default" }

variable "qemu_connect" { default = "qemu:///system" }

variable "kubeadm_home" { default = "artifacts/kubeadm" }

variable "kubeadm_nodes" { 

  type = map(object({ role = string, octetIP = string , vcpu = number, memoryMB = number, incGB = number}))
  default = { 
    mgmt = { role = "master-init",  octetIP = "101" , vcpu = 2, memoryMB = 1024 * 8, incGB = 150},
    svc = { role = "master-init",   octetIP = "201" , vcpu = 2, memoryMB = 1024 * 8, incGB = 150},
  }
}

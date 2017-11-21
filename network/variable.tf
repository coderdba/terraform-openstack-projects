# Create network
resource "openstack_networking_network_v2" "nw1773_1" {
  name           = "nw1773_1"
  admin_state_up = "true"
}


# Create subnet
resource "openstack_networking_subnet_v2" "sn1773_1" {
  name       = "sn1773_1"
  network_id = "${openstack_networking_network_v2.nw1773_1.id}"
  cidr       = "192.168.20.0/24"
  ip_version = 4
}

# Create router AND attach it to an External Network
# Note: This 'gateway' is the UUID of the VLAN to which to connect 
resource "openstack_networking_router_v2" "rr1773_1" {
  name             = "rr1773_1"
  #external_gateway = "ext_vlan1773_net"
  external_gateway = "31465454-86f9-428e-b462-935489290d11"
}

# Attach router to internal network (subnet)
resource "openstack_networking_router_interface_v2" "rr1773_1_interfaces" {
  router_id = "${openstack_networking_router_v2.rr1773_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.sn1773_1.id}"
}
$ vi x
$ cat x
variable "flavor" {
default = "smallmem-2vcpu"
}

variable "image" {
default = "redis_ubuntu_2instance_myproject"
}

variable "ssh_user_name" {
default = "ubuntu"
}

variable "openstack_user_name" {
    description = "The username for the Tenant."
    default  = "myusername"
}

variable "openstack_tenant_name" {
    description = "The name of the Tenant."
    default  = "MYPROJECT"
}

variable "openstack_password" {
    description = "The password for the Tenant."
    default  = "mypassword"
}

variable "openstack_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default  = "https://openstack.company.com:5000/v2.0"
}

variable "openstack_keypair" {
    description = "The keypair to be used."
    default  = "MyTgtSshKey"
}

variable "tenant_network" {
    description = "The network to be used."
    default  = "MyNetwork"
}

variable "tenant_security_group" {
    description = "The network to be used."
    default  = "TCPExternalSG"
}

variable "ssh_key_file" {
default = "~/.ssh/id_rsa.terraform"
}

#variable "external_gateway" {
#}

variable "pool" {
default = "public"
}

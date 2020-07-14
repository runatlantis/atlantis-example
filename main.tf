/**************************************************************************************************************************************
*   1.  VCN
*       Compartment - root compartment
*       Name: DemoVCN
*       CIDR - 10.1.0.0/16,
*       Public Subnet - 10.1.0.0/24 with security list opened with ports 22,80
*       Internet GW + Proper Route
*
*   2.  Compute
*       1 x Small Compute  + Setup Apache Web with return host name as string
*
*   *.  Output - Public IP of the web server
*
*
*****************************************************************************************************************************************/

variable "tenancy_ocid" {
                                default="ocid1.compartment.oc1..aaaaaaaa3pkequhrpjjdqd4i7ldhs6piblz2hiadbk5i3juy3xautlmzypxa"
}

variable "public_key_path" {
                                default="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwsLOjrH+ukEk72AW5hUvyAMf+J6ES8vC3uFglIFK6SkcvsAFHkoYrHJoJmxRGe3Fwo9WmnwgxqMbhA0gEnBFP6IhxwNgWxSkB0M1uTCLNJ4WXlYKoXwh50GelBsRcryzuzDchCXm7kA4U0/KzD4KPMb+KveDmArRugLEK4gS8TDJBGCCSTOrYOhvQb/s7qkrDOT+rQDhYs+C/kmBPbs/XwJsOUiQi4crUamYqPyq71oWGBnXBUEi6qWnywwchOAT1VRRpT+I/hlx8HZt03EZy/Fvl+86sMISoDXN9mgL3D5xZJNCFw8iKzmPUr+HMsoNW8Hlf5B6+hmNH0GPotqHrw== rsa-key-20191127"
}

variable "region" {
                        default="us-ashburn-1"
}


provider "oci" {
  auth             = "InstancePrincipal"
  region           = var.region
}

# Variables for VCN
variable "vcn_cidr" {
  default = "10.1.0.0/16"
}

variable "vcn_name" {
  default = "demoVCN"
}

variable "vcn_dns" {
  default = "demovcn"
}

variable "vcn_ig_name" {
  default = "demoIG"
}

variable "vcn_route_name" {
  default = "demoRouteTable"
}

# Variables for public subnet
variable "pub_sec_name" {
  default = "demoPubSecName"
}

variable "pub_subnet1" {
  default = "10.1.0.0/24"
}

variable "pub_subnet1_name" {
  default = "pub_subnet1"
}

variable "pub_subnet1_dns" {
  default = "pubsub1"
}

# Variables for Compute
variable "webHost1" {
  default = "demoHostWeb01"
}

variable "InstanceShape" {
  default = "VM.Standard1.2"
}

variable "publicIP" {
  default = "true"
}

variable "os_name" {
  default = "Oracle Linux"
}

variable "os_version" {
  default = "7.8"
}

variable "user-data" {
  default = <<EOF
#!/bin/bash -x
yum -y install httpd
# Open port 80 on the firewall to allow http and https traffic through:
firewall-offline-cmd --add-service=http
systemctl enable firewalld
systemctl restart firewalld
# Start the web server:
systemctl start httpd
# Add an index.htm file on each instance to indicate which server it is.
hostname >/var/www/html/index.html
EOF

}

#---------------------------------------------
# Create VCN
#---------------------------------------------
resource "oci_core_virtual_network" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.tenancy_ocid
  display_name   = var.vcn_name
  dns_label      = var.vcn_dns
}

# Internet GW
resource "oci_core_internet_gateway" "ig" {
  compartment_id = oci_core_virtual_network.vcn.compartment_id
  display_name   = var.vcn_ig_name
  vcn_id         = oci_core_virtual_network.vcn.id
}

# Route
resource "oci_core_route_table" "vcnRoute" {
  compartment_id = oci_core_virtual_network.vcn.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = var.vcn_route_name
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.ig.id
  }
}

# Security List
resource "oci_core_security_list" "vcnSec" {
  compartment_id = oci_core_virtual_network.vcn.compartment_id
  display_name   = var.pub_sec_name
  vcn_id         = oci_core_virtual_network.vcn.id
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }
  ingress_security_rules {
    tcp_options {
      max = 80
      min = 80
    }
    protocol = "6"
    source   = "0.0.0.0/0"
  }
  ingress_security_rules {
    tcp_options {
      max = 22
      min = 22
    }
    protocol = "6"
    source   = "0.0.0.0/0"
  }
  ingress_security_rules {
    protocol = "6"
    source   = var.vcn_cidr
  }
}

# Load all Availablity Domains to local data variable from the VCN compartment
data "oci_identity_availability_domains" "ADs" {
  compartment_id = oci_core_virtual_network.vcn.compartment_id
}

# Subnet
resource "oci_core_subnet" "pubSubnetAD1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  cidr_block          = var.pub_subnet1
  display_name        = var.pub_subnet1_name
  compartment_id      = oci_core_virtual_network.vcn.compartment_id
  vcn_id              = oci_core_virtual_network.vcn.id
  route_table_id      = oci_core_route_table.vcnRoute.id
  security_list_ids   = [oci_core_security_list.vcnSec.id]
  dhcp_options_id     = oci_core_virtual_network.vcn.default_dhcp_options_id
  dns_label           = var.pub_subnet1_dns
}


#---------------------------------------------
# Create web compute instance
#---------------------------------------------
resource "oci_core_instance" "webhost01" {
  availability_domain = oci_core_subnet.pubSubnetAD1.availability_domain
  compartment_id      = oci_core_subnet.pubSubnetAD1.compartment_id
  display_name        = var.webHost1
  source_details {
    source_type = "image"
    source_id = "ocid1.image.oc1.iad.aaaaaaaabip6l5i5ikqsnm64xwrw2rrkj3tzo2dv47frowlt3droliwpvfaa"
  }
  shape = var.InstanceShape
  create_vnic_details {
    subnet_id        = oci_core_subnet.pubSubnetAD1.id
    assign_public_ip = var.publicIP
  }
  metadata = {
    ssh_authorized_keys = (var.public_key_path)
    user_data           = base64encode(var.user-data)
  }
  timeouts {
    create = "60m"
  }
}

# Gets a list of vNIC attachments on the instances
data "oci_core_vnic_attachments" "webhost01VnicsAttach" {
  compartment_id      = oci_core_instance.webhost01.compartment_id
  availability_domain = oci_core_instance.webhost01.availability_domain
  instance_id         = oci_core_instance.webhost01.id
}

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "webhost01Vnics" {
  vnic_id = data.oci_core_vnic_attachments.webhost01VnicsAttach.vnic_attachments[0]["vnic_id"]
}

# Output
output "webhost01_public_ip" {
  value = data.oci_core_vnic.webhost01Vnics.public_ip_address
}



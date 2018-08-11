provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
 
  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Drift"
}
 
data "vsphere_datastore" "datastore" {
  name          = "r710-02"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_compute_cluster" "cluster" {
  name          = "Lab"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_network" "network" {
  name          = "DPortGroup"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_virtual_machine" "template" {
  name          = "${var.Template_Name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.Computer_Name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder = "${var.Mappe}"
  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
 
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware = "efi"
 
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
 
  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }
 
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
 
    customize {
      windows_options {
        computer_name = "${var.Computer_Name}"
        join_domain = "${var.Domain_Name}"
 domain_admin_user = "${var.Domain_User}@${var.Domain_Name}"
 admin_password = "${var.Domain_Password}"
      }
      network_interface {
         dns_server_list = "${var.virtual_machine_dns_servers}"
      }
    }
  }
}

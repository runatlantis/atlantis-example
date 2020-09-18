// Configure the Google Cloud provider
provider "google" {
 credentials = file("/tmp/CREDENTIALS_FILE.json")
 project     = "heroic-muse-289316"
 region      = "us-west1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// Resource for ips
resource "google_compute_address" "static" {
  name = "controller"
}

resource "google_compute_address" "static2" {
  name = "client"
}


// A single Compute Engine instance
resource "google_compute_instance" "controller001" {
 name         = "dmalicia-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
//   metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
   metadata_startup_script = file("/tmp/controllerbootstrap.sh")
 metadata = {
   ssh-keys = "dmalicia:${file("/tmp/id_rsa.pub")}"
            }
 network_interface {
   network = "default"

   access_config {
     nat_ip = google_compute_address.static.address
   }
 }
}


// A single Compute Engine instance
resource "google_compute_instance" "client001" {
 name         = "dm-client-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
   metadata_startup_script = file("/tmp/bootstrap.sh")
 metadata = {
   ssh-keys = "dmalicia:${file("/tmp/id_rsa.pub")}"
            }
 network_interface {
   network = "default"

   access_config {
     nat_ip = google_compute_address.static2.address
   }
 }
}

 output "controller" {
  value = google_compute_instance.controller001.network_interface.0.access_config.0.nat_ip
}

 output "client1" {
  value = google_compute_instance.client001.network_interface.0.access_config.0.nat_ip
}


resource "google_compute_firewall" "test" {
 name    = "test-app-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000","8500","8301","8300","8302","8140"]
 }
}

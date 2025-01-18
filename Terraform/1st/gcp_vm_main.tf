provider "google" {
    credentials = file("gcp-credentials.json") //Auth key downloaded from gcp
    project = "terraform-328516"  // project id of created project 
    region  = "europe-west4"
    zone = "europe-west4-a"
}

resource "google_compute_instance" "default" {  // can replace default by any name
    name         = "terraform-instance"  // user-defined as well
    machine_type = "e2-micro"   // CPU
    tags         = ["terraform"]

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"  // operating system
        }
    }

    network_interface {
        network = "default"  // gcp will itself assign public IP

        access_config {
            // Ephemeral external IP address
        }
        }
}
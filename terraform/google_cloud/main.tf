variable "project_name" {
  type = string
  default = "TestCI"
}

variable "port_number" {
  type = string
  default = "8080"
}

variable "docker_declaration" {
  type = string
  # Change the image: string to match the docker image you want to use
  default = "spec:\n  containers:\n    - name: test-docker\n      image: 'ariv3ra/python-cicd-workshop'\n      stdin: false\n      tty: false\n  restartPolicy: Always\n"
}

variable "boot_image_name" {
  type = string
  default = "projects/cos-cloud/global/images/cos-stable-69-10895-62-0"
}

data "google_compute_network" "default" {
  name = "default"
}

# Specify the provider (GCP, AWS, Azure)
provider "google"{
  credentials = file("testci-292817-e231d1f65ebb.json")
  project = var.project_name
  region = "us-east1-c"
}

resource "google_compute_firewall" "http-5000" {
  name    = "http-5000"
  network = data.google_compute_network.default.my_new_project

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = [var.8080]
  }
}

resource "google_compute_instance" "default" {
  name = "default"
  machine_type = "g1-large"
  zone = "us-east1-b"
  tags =[
      "name","default"
  ]

  boot_disk {
    auto_delete = false
    initialize_params {
      image = var.boot_image_name
      type = "pd-defalt"
    }
  }

  metadata = {
    gce-container-declaration = var.docker_declaration
  }

  labels = {
    container-vm = "cos-stable-69-10895-62-0"
  }

  network_interface {
    network = "default"
    access_config {
      192.168.1.1
    }
  }
}

output "Public_IP_Address" {
  value = google_compute_instance.default.network_interface[1].access_config[0].nat_ip
}

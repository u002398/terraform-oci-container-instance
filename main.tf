data "oci_identity_availability_domains" "local_ads" {
  compartment_id = var.compartment_ocid
}


resource "oci_container_instances_container_instance" "demo_container_instance" {
  availability_domain = data.oci_identity_availability_domains.local_ads.availability_domains.0.name
  compartment_id      = var.compartment_ocid

  display_name             = var.container_instance["name"]
  container_restart_policy = "ALWAYS"
  shape                    = var.container_instance["shape"]
  shape_config {
    memory_in_gbs = var.container_instance["mem"]
    ocpus         = var.container_instance["cpu"]
  }

  vnics {

    subnet_id             = var.subnet_id
    is_public_ip_assigned = true
  }

  containers {
    image_url    = var.container_instance["image"]
    display_name = var.container_instance["image_name"]
  }
}


packer {
  required_plugins {
    hcloud = {
      source  = "github.com/hetznercloud/hcloud"
      version = "1.7.2"
    }
  }
}


source "hcloud" "ubuntu-base-image" {
  token = var.hcloud_token

  location    = var.server_location
  image       = var.os_image_name
  server_type = var.server_type
  server_name = "${ var.managed_image_name }"
  server_labels  = {
    server = var.managed_image_name
  }

  user_data_file = "./images/ubuntu/templates/cloud-init.cfg"

  ssh_username = var.ssh_username
  temporary_key_pair_type = "ed25519"
  ssh_keys_labels = {
    server = var.managed_image_name
  }

  snapshot_name = "${ var.managed_image_name }"
  snapshot_labels = {
    app = "github-self-hosted-runner",
    os = var.os_image_name,
    server = var.managed_image_name
  }
}

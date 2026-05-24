variable "hcloud_token" {
  type      = string
  sensitive = true
  default   = "${env("HCLOUD_TOKEN")}"
}

variable "helper_script_folder" {
  type    = string
  default = "/imagegeneration/helpers"
}

variable "image_folder" {
  type    = string
  default = "/imagegeneration"
}

variable "imagedata_file" {
  type    = string
  default = "/imagegeneration/imagedata.json"
}

variable "installer_script_folder" {
  type    = string
  default = "/imagegeneration/installers"
}

variable "server_location" {
  type    = string
  #default = "hel1"
  default   = "${env("HCLOUD_SERVER_LOCATION")}"
}

variable "os_image_name" {
  type    = string
  #default = "ubuntu-22.04"
  default   = "${env("HCLOUD_SERVER_IMAGE")}"
}

variable "image_version" {
  type    = string
  default = "${env("IMAGE_VERSION")}"
}

variable "server_type" {
  type    = string
  #default = "ccx13"
  default   = "${env("HCLOUD_SERVER_TYPE")}"
}

variable "ssh_username" {
  type      = string
  default   = "root"
}

variable "managed_image_name" {
  type    = string
  default   = "${env("HCLOUD_OBJECT_NAME")}"
  
}

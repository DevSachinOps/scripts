variable "rg_location" {
  default = ""
}
variable "rg_name" {
  default = "RESOURCE_GROUP_NAME"
}

variable "vnet_name" {
  default = "VIRTUAL_NET_NAME"
}

variable "ubuntu_ip" {
  default = "PRIVATE_IP_FROM_SUBNET"
}
variable "ubuntu_subnet" {
  default = "/subscriptions/SUBSCRIPTION_ID/resourceGroups/RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/VIRTUAL_NETWORK_NAME/subnets/SUBNET_NAME"
}

variable "ubuntu_password" {
  default = "PASSWORD_FOR_UBUNTU"
}

variable "time" {
  default = 60
}

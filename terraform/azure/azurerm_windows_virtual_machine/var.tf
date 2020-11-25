variable "rg_location" {
  default = ""
}
variable "rg_name" {
  default = "RESOURCE_GROUP_NAME"
}

variable "vnet_name" {
  default = "VIRTUAL_NETWORK_NAME"
}
variable "env" {
  default = "DEV"
}
variable "windows_ip" {
  default = "STATIC_IP_FROM_SUBNET"
}
variable "windows_subnet" {
  default = "/subscriptions/SUBSCRIPTION_ID/resourceGroups/RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/VIRTUAL_NETWORK_NAME/subnets/SUBNET_NAME"
}

variable "windows_password" {
  default = "PASSWORD"
}

variable "time" {
  default = 60
}

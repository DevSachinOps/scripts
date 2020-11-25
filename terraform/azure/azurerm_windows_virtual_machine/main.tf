resource "azurerm_public_ip" "windows_public_ip" {
  name                    = "${env}-pip"
  location                = var.rg_location
  resource_group_name     = var.rg_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = var.env
    time        = var.time
  }
}

resource "azurerm_network_interface" "windows_nic_1" {
  name                = "${env}-nic-1"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${env}-ipconf1"
    subnet_id                     = var.windows_subnet
    private_ip_address_allocation = "Static"
    private_ip_address            = var.windows_ip
    public_ip_address_id          = azurerm_public_ip.windows_public_ip.id
  }
}

resource "azurerm_network_security_group" "poc01_windows1_nsg" {
  name                = "${env}-windows01-nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.env
    time        = var.time
  }
}

resource "azurerm_network_interface_security_group_association" "windows_nic_nsg" {
  network_interface_id      = azurerm_network_interface.windows_nic_1.id
  network_security_group_id = azurerm_network_security_group.poc01_windows1_nsg.id
  depends_on                = [azurerm_network_interface.windows_nic_1, azurerm_network_security_group.poc01_windows1_nsg]
}

resource "azurerm_windows_virtual_machine" "windows01" {
  name                = "${env}-windows01"
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_D2s_v3"

  network_interface_ids = [
    azurerm_network_interface.windows_nic_1.id,
  ]

  admin_username      = "azureuser"
  admin_password      = var.windows_password
  computer_name       = "JumpHost"

  source_image_reference {
    offer = "windows-10"
    publisher = "MicrosoftWindowsDesktop"
    sku = "19h2-pro-g2"
    version = "latest"
  }
  
  os_disk {
    disk_size_gb         = "30"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  license_type = "Windows_Client"

  tags = {
    environment = "poc01"
    time        = var.time
  }

  timeouts {
    create = "2h"
    delete = "2h"
  }

  depends_on = [azurerm_network_interface.windows_nic_1, azurerm_public_ip.windows_public_ip]
}

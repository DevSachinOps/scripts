resource "azurerm_public_ip" "ubuntu_public_ip" {
  name                    = "poc01-pip"
  location                = var.rg_location
  resource_group_name     = var.rg_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "poc01"
    time        = var.time
  }
}

resource "azurerm_network_interface" "ubuntu_nic_1" {
  name                = "poc01-nic-1"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "poc01ipconf1"
    subnet_id                     = var.ubuntu_subnet
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ubuntu_ip
    public_ip_address_id          = azurerm_public_ip.ubuntu_public_ip.id
  }
}

resource "azurerm_network_security_group" "poc01_ubuntu1_nsg" {
  name                = "poc01-ubuntu1-nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "poc01"
    time        = var.time
  }
}

resource "azurerm_network_interface_security_group_association" "ubuntu_nic_nsg" {
  network_interface_id      = azurerm_network_interface.ubuntu_nic_1.id
  network_security_group_id = azurerm_network_security_group.poc01_ubuntu1_nsg.id
  depends_on                = [azurerm_network_interface.ubuntu_nic_1, azurerm_network_security_group.poc01_ubuntu1_nsg]
}

resource "azurerm_linux_virtual_machine" "ubuntu01" {
  name                = "poc01-ubuntu01"
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_F2"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.ubuntu_nic_1.id,
  ]

  admin_password                  = var.ubuntu_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = "poc01"
    time        = var.time
  }
  depends_on = [azurerm_network_interface.ubuntu_nic_1, azurerm_public_ip.ubuntu_public_ip]
}

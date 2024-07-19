
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "webserver_rg" {
  name     = "webserver-resources"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "webserver_vnet" {
  name                = "webserver-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name
}

resource "azurerm_subnet" "webserver_subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.webserver_rg.name
  virtual_network_name = azurerm_virtual_network.webserver_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "webserver_publicip" {
  name                = "webserver-public-ip"
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "webserver_nic" {
  name                = "webserver-nic"
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.webserver_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webserver_publicip.id
  }
}

resource "azurerm_linux_virtual_machine" "webserver_vm" {
  name                = "webserver-machine"
  resource_group_name = azurerm_resource_group.webserver_rg.name
  location            = azurerm_resource_group.webserver_rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.webserver_nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

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

  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              EOF
  )
}
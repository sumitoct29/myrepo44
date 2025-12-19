resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
    
  }
}


data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = var.vnetname
  resource_group_name  = var.resource_group_name
}


data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}


data "azurerm_key_vault" "kv" {
  name                = "kv-newtodo123"
  resource_group_name = "rg-newtodo"
}

data "azurerm_key_vault_secret" "username" {
  name         = "adminname"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "adminpasswd"
  key_vault_id = data.azurerm_key_vault.kv.id
}




resource "azurerm_linux_virtual_machine" "lin_vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = "Standard_D2s_v3"
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }
  
  
  
  
  
  
  
  
  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF
  )


}


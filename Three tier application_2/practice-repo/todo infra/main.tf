# itne rg
#all doneq
module "rg" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo"
  resource_group_location = "central india"
  
}


module "rg-3" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo3"
  resource_group_location = "central india"
  
}

module "rg-6" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo6"
  resource_group_location = "central india"
  
}



module "rg-1" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo1"
  resource_group_location = "central india"
  
}


module "rg-7" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo7"
  resource_group_location = "central india"
  
}

module "rg-9" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo9"
  resource_group_location = "central india"
  
}




module "rg-2" {
  source = "../Module/rg"

  resource_group_name     = "rg-newtodo2"
  resource_group_location = "central india"
  
}


module "vnet" {
  depends_on = [ module.rg ]
  source = "../Module/vnet"

  resource_group_name        = "rg-newtodo"
  resource_group_location    = "central india"
  vnet_name                  = "vnet-newtodo"
  vnet_address_space         = ["10.0.0.0/16"]


}


module "subnet_frontend" {
  depends_on = [ module.vnet ]
  source = "../Module/subnet"

  resource_group_name     = "rg-newtodo"
 
  vnet_name               = "vnet-newtodo"
  subnet_name             = "subnet-frontend"
  subnet_address_prefixes = ["10.0.1.0/24"]
  }


module "subnet_backend" {
  depends_on = [ module.vnet ]
  source = "../Module/subnet"

  resource_group_name     = "rg-newtodo"
 
  vnet_name               = "vnet-newtodo"
  subnet_name             = "subnet-backend"
  subnet_address_prefixes = ["10.0.2.0/24"]
  }

module "pip" {
  depends_on = [ module.rg ]
  source = "../Module/pip"

  pip_name                = "pip-newtodo"
  resource_group_name     = "rg-newtodo"
  resource_group_location = "central india"
  allocation_method   = "Static"
}
  
module "bpip" {
 
  source = "../Module/pip"
  pip_name                = "pip-backendtodo"
  resource_group_name     = "rg-newtodo"
  resource_group_location = "central india"
  allocation_method   = "Static"
  }


module "frontend_vm" {
  depends_on = [ module.subnet_frontend, module.pip ]
  source = "../Module/virtual_machine"

  nic_name                = "nic-newfronttodo"
  resource_group_name     = "rg-newtodo"
  resource_group_location = "central india"
  vm_name                 = "vm-fronttodo"
  
  image_publisher         = "Canonical"
  image_offer             = "0001-com-ubuntu-server-jammy"
  image_sku               = "22_04-lts-gen2"
  subnet                  = "subnet-frontend"
  vnetname                = "vnet-newtodo"
  pip_name                = "pip-newtodo"

}



module "backend_vm" {
  depends_on = [ module.subnet_backend]
  source = "../Module/virtual_machine"

  nic_name                = "nic-backendtodo"
  resource_group_name     = "rg-newtodo"
  resource_group_location = "central india"
  vm_name                 = "vm-backendtodo"
  #admin_username          = "adminuser"
  #admin_password          = "P@ssw0rd1234!"
  image_publisher         = "Canonical"
  image_offer             = "0001-com-ubuntu-server-jammy"
  image_sku               = "22_04-lts-gen2"
  subnet             = "subnet-backend"
  vnetname                = "vnet-newtodo"
  pip_name           = "pip-backendtodo"
  
}


module "mysql_server" {
  depends_on = [ module.rg ]
  source = "../Module/mysql_server"

  mssql_server_name          = "mssqlserver1200"
  resource_group_name        = "rg-newtodo"
  resource_group_location    = "central india"
  administrator_login        = "missadministrator"
  administrator_login_password = "thisIsKat11"
 }

module "sql_db" {
  depends_on = [ module.mysql_server ]
  source = "../Module/mysql_db"

  db_name                = "mysqldb"
  resource_group_name        = "rg-newtodo"
 
  
  server_name            = "mssqlserver1200"
  
}
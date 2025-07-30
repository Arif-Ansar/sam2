module "resource_group"{
    source = "../modules/azurerm_resource_group"
    resource_group_location = "centralindia"
    resource_group_name = "tikks1"
}
module "resource_group1"{
    source = "../modules/azurerm_resource_group"
    resource_group_location = "centralindia"
    resource_group_name = "tikks2"
}
module "virtual_network"{
    depends_on = [module.resource_group]
    source = "../modules/azurerm_virtual_network"
    virtual_network_name = "vnet2"
    resource_group_name = "tikks1"
    location = "centralindia"
    address_space = ["10.0.0.0/16"]
}

module "frontend_subnet"{
    depends_on = [module.virtual_network]
    source = "../modules/azurerm_subnet"
    subnet_name = "frontend_subnet"
    resource_group_name = "tikks1"
    virtual_network_name = "vnet2"
    address_prefixes = ["10.0.1.0/24"]
}

module "backend_subnet"{
    depends_on = [module.virtual_network]
    source = "../modules/azurerm_subnet"
    subnet_name = "backend_subnet"
    resource_group_name = "tikks1"
    virtual_network_name = "vnet2"
    address_prefixes = ["10.0.2.0/24"]
}

module "frontend_public_ip"{
    depends_on = [module.resource_group]
    source = "../modules/azurerm_public_ip"
    public_ip_name = "frontend_public_ip"
    resource_group_name = "tikks1"
    location = "centralindia"
    allocation_method = "Static"
}

module "key_vault"{
    depends_on =[module.resource_group]
    source = "../modules/azurerm_key_vault"
    Key_Vault_name = "gulugulu"
    resource_group_name = "tikks1"
    location = "centralindia"
}

module "vm-password"{
    depends_on = [module.key_vault]
    source = "../modules/azurerm_key_vault_secret"
    key_vault_secret_name = "adminpassword"
    key_vault_secret_value = "Alliswell@1234"
    key_vault_name = "gulugulu"
    resource_group_name = "tikks1"
}

module "lunix_vertual_machine"{
    depends_on = [module.resource_group,module.virtual_network,module.frontend_subnet,module.frontend_public_ip,module.key_vault,module.vm-password]
    source = "../modules/azurerm_vertual_machine"
    nic_name = "frontend_nic"
    resource_group_name = "tikks1"
    location = "centralindia"
    public_ip_name = "frontend_public_ip"
    public_ip_resource_group_name = "tikks1"
    frontend_subnet_name = "frontend_subnet"
    virtual_network_name =  "vnet2"
    Virtual_machine_name = "frontend-vm"
    size = "Standard_B1s"
    admin_username = "adminuser"
    key_vault_name = "gulugulu"
    key_vault_secret_name = "adminpassword"
    image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"

}

module "mssql_server"{
    source = "../modules/azurerm_sql_server"
    sql_server_name = "guluguluserver"
    resource_group_name = "tikks1"
    location = "centralindia"
    username = "testserver1"
    password = "Alliswell@1234"
}


module "sql_database"{
    depends_on = [module.mssql_server]
    source = "../modules/azurerm_sql_database"
    sqldatabase_name = "mydatabase2323"
    mssql_server_name = "guluguluserver"
    resource_group_name = "tikks1"
}
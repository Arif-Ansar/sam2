resource "azurerm_network_interface" "nic"{
    name = var.nic_name
    resource_group_name = var.resource_group_name
    location = var.location
    ip_configuration {
        public_ip_address_id = data.azurerm_public_ip.frontend_public_ip.id
        name = "internal"
        subnet_id = data.azurerm_subnet.frontend_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "virtual_machine"{
    name = var.Virtual_machine_name
    resource_group_name = var.resource_group_name
    location = var.location
    size = var.size
    admin_username = var.admin_username
    admin_password = data.azurerm_key_vault_secret.password.value
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.nic.id]

    os_disk{
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = var.image_publisher
        offer = var.image_offer
        sku = var.image_sku
        version = var.image_version
    }
}

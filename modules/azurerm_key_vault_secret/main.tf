resource "azurerm_key_vault_secret" "password"{
    name = var.key_vault_secret_name
    value = var.key_vault_secret_value
    key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault" "kv"{
    name = var.key_vault_name
    resource_group_name = var.resource_group_name
}
resource "azurerm_mssql_database" "sql_database"{
    name = var.sqldatabase_name
    server_id = data.azurerm_mssql_server.sql_server.id
    collation = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 5
    sku_name = "S0"
}

data "azurerm_mssql_server" "sql_server"{
    name = var.mssql_server_name
    resource_group_name = var.resource_group_name
}
variable "sql_server_name"{
    description = "name of the aql server"
    type = string
}

variable "resource_group_name"{
    description = "name of the resource group of sql server"
    type = string
}

variable "location"{
    description = "location of the sql server"
    type = string
}
variable "username"{
    description = "username of the administrator"
    type = string
}

variable "password"{
    description = "password of the user administrator"
    type = string
    sensitive = true
}


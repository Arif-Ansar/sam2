variable "nic_name"{
    description = "name of the network interface"
    type = string
}

variable "resource_group_name"{
    description = "name of the resource group of network interface"
    type = string
}

variable "location"{
    description = "location of the network interface"
    type = string
}

variable "public_ip_name"{
    description = "name of the public ip"
    type = string
}

variable "public_ip_resource_group_name"{
    description = "name of resource group of public ip"
    type = string
}

variable "frontend_subnet_name"{
    description = "name of the frontend subnet"
    type = string
}

variable "virtual_network_name"{
    description = "name of the virtual machine"
    type = string
}


variable "Virtual_machine_name"{
    description = "name of the virtual machine"
    type = string
}

variable "size"{
    description = "size of the virtual machine"
    type = string
}

variable "admin_username"{
    description = "username name of the vertual machine"
    type = string
}

variable "key_vault_name"{
    description = "name of the key vault"
    type = string
}
variable "key_vault_secret_name"{
    description = "name of the secret"
    type = string
}
variable "image_publisher"{
    description = "name of the image publisher"
    type = string
}
variable "image_offer"{
    description = "offer name of the image publisher"
    type = string
}
variable "image_sku"{
    description = "sku of the image"
    type = string
}
variable "image_version"{
    description = "version of the image"
    type = string
}







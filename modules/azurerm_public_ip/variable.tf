variable "public_ip_name"{
    description = "name of the public ip for frontend vm"
    type = string
}
variable "resource_group_name"{
    description = "name of the resource group for public ip"
    type = string
}
variable "location"{
    description = "location of public ip"
    type = string
}
variable "allocation_method"{
    description = "allocation method of the public ip"
    type = string
    default = "Static"
}
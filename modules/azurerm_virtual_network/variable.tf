variable "virtual_network_name"{
    description = "name of the virtual network"
    type = string
}
variable "resource_group_name"{
    description = "name of resource group of virtual network"
    type = string
}
variable "location"{
    description = "location of the virtual network"
    type = string
}
variable "address_space"{
    description = "address space of the virtual network"
    type = list(string)
}
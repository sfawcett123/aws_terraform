variable "default_tags" {
    type = map
    description = "Default Tags [Optional]"
    default = {
        environment_type = "Dev Environment"
    }
}
variable "name" {
   type = string
   description = "Name (Optional)"
   default = "Cluster"
}

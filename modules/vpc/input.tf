variable "default_tags" {
    type = map
    description = "Default Tags [Optional]"
    default = {
        environment_type = "Dev Environment"
    }
} 

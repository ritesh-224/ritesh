variable "mssql_database" {
    type = map(object({
        name         = string
        collation    = string
        license_type = string
        max_size_gb  = number
        sku_name     = string
        enclave_type = string
    })) 
}

variable "rg_name" {
    type = string
}
variable "sql_server_name" {
    type = string
}
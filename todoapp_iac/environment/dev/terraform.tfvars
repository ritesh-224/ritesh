rg = {
  rg1 = {
    rg_name    = "test"
    location   = "centralindia"
    managed_by = "devops-team"
    tags = {
      "environment" = "dev"
    }
  }
}
networks = {
  vnet1 = {
    name          = "TodoVnet"
    location      = "centralindia"
    rg_name       = "test"
    address_space = ["10.0.0.0/16"]
    tags = {
      "environment" = "dev"
    }
    subnets = {

      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

public_ips = {

  pip1 = {
    name              = "lb_pip"
    location          = "centralindia"
    rg_name           = "test"
    allocation_method = "Static"
    ip_version        = "IPv6"
    tags = {
      "environment" = "dev"
    }
  }

  #   pip2 = {
  #     name = "backend_pip"
  #     location = "centralindia"
  #     rg_name = "test"
  #     allocation_method = "Static"
  #     ip_version     = "IPv6"
  #     tags = {
  #       "environment" = "dev"
  #     }
  #   }
}

key_vault = {
  kv1 = {
    name     = "todo-kv"
    location = "centralindia"
    rg_name  = "test"
    sku_name = "standard"

    access_policies = {
      policy1 = {
        key_permissions         = ["Get", "List", "Create", "Delete", "Update"]
        secret_permissions      = ["Get", "List", "Set", "backup", "restore", "recover", "purge"]
        storage_permissions     = ["get", "list", "set", "delete", "restore", "recover"]
        certificate_permissions = []
      }
    }
  }
}

secrets = {
  secret1 = {
    name  = "username1"
    value = "adminuser1"
  }
  secret2 = {
    name  = "password1"
    value = "P@ssw0rd1234!"
  }
  secret3 = {
    name  = "username2"
    value = "adminuser2"
  }
  secret4 = {
    name  = "password2"
    value = "P@ssw0rd5678!"
  }
}
vms = {
  vm1 = {
    nic_name                        = "frontend-nic"
    rg_name                         = "test"
    location                        = "centralindia"
    vnet_name                       = "TodoVnet"
    subnet_name                     = "frontend-subnet"
    vm_name                         = "frontend-vm"
    vm_size                         = "Standard_B1s"
    admin_username                  = "adminuser1"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    config_name                     = "nic1-config"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "20_04-LTS"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name                        = "backend-nic"
    rg_name                         = "test"
    location                        = "centralindia"
    vnet_name                       = "TodoVnet"
    subnet_name                     = "backend-subnet"
    vm_name                         = "backend-vm"
    vm_size                         = "Standard_B1s"
    admin_username                  = "adminuser2"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    config_name                     = "nic2-config"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "20_04-LTS"
      version   = "latest"
    }
  }
}

mssql_server = {
  mssql1 = {
    server_name                   = "todo-mssql-server"
    rg_name                       = "test"
    location                      = "centralindia"
    server_login_name             = "mssqladmin"
    server_login_password         = "StrongP@ssw0rd!"
    public_network_access_enabled = false
    tags = {
      "environment" = "dev"
    }
  }
}

mssql_database = {
  db1 = {
    name         = "todo-database-1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 5
    sku_name     = "S0"
    enclave_type = "VBS"
  }
}

public_lb = {
  lb1 = {
    name     = "todo-public-lb"
    location = "centralindia"
    rg_name  = "test"
    sku      = "Standard"
    sku_tier = "Regional"
    frontend_ip_configs = {
      config1 = {
        name = "LBFrontEnd"
      }
    }
    tags = {
      "environment" = "dev"
    }
  }
}



health_prob = {
  probe1 = {
    name     = "tcp-probe"
    protocol = "Tcp"
    port     = 80
    rg_name  = "test"
  }
}

lb_rules = {
  rule1 = {
    name                           = "http-rule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "LBFrontEnd"
    floating_ip_enabled            = false
    idle_timeout_in_minutes        = 4
  }
}
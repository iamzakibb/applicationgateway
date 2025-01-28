
resource "azurerm_resource_group" "main" {
  name     = "web-app-rg"
  location = "East US"
  tags = {
    Environment = "Production"
  }
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_address_space  = ["10.0.0.0/16"]
  existing_vnet_id    = var.existing_vnet_id
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnets             = module.network.subnet_ids
}

module "app_service_plan" {
  source              = "./modules/app_service"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_sku    = "B1"
}

module "web_app" {
  source              = "./modules/app_service"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  app_service_plan_id = module.app_service_plan.plan_id
  app_name            = "webapp-${random_string.suffix.result}"
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  storage_accounts    = ["webappdata", "webappcontent"]
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.network.sql_subnet_id
  sql_admin_login = ""
  sql_admin_password = ""
  aad_admin_object_id = ""
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  web_app_id          = module.web_app.app_id
}

module "app_gateway" {
  source              = "./modules/app_gateway"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.network.gateway_subnet_id
  backend_address     = module.web_app.private_ip
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}
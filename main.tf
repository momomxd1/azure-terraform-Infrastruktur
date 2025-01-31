terraform {
backend "local" {}
}

provider "azurerm" {
  features {}

   subscription_id = var.subscription_id
}

# Erstelle eine Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "my-free-terraform-rg"
  location = "West Europe"
}


# Erstelle ein Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "my-free-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Erstelle ein Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "my-free-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Erstelle eine Network Security Group (NSG)
resource "azurerm_network_security_group" "nsg" {
  name                = "my-free-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

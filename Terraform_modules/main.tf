 module "configuration1" {
 source = "./NIC"
  nic = "priya_nic"
  ipconfig = "priyaip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resource_Group"
  resource_group = "priyaRG6"
  location = "eastus"
  }

module "configuration3" {
  source = "./VM"
  vm= "priyavm1"
  size = "standard_f2"
  vmuser_name = "priyaweb1"
  user_password = "webpriya@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./VNet"
  vnet = "priyavnet"
  cidr_block = "11.168.0.0/16"
  vsub = "priyasubnet"
  ip_address = "11.168.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}
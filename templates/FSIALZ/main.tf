module "management_groups_layer_1" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_1
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = each.value.parent_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_2" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_2
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_1[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_3" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_3
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_2[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_4" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_4
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_3[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_5" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_5
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_4[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_6" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_6
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_5[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

module "management_groups_layer_7" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "~> 0.6.0"
  for_each           = local.management_groups_layer_7
  id                 = each.value.id
  display_name       = each.value.display_name
  parent_resource_id = module.management_groups_layer_6[each.value.parent].management_group_resource_id
  base_archetype     = each.value.base_archetype
  default_location   = var.default_location
  subscription_ids   = each.value.subscriptions
  enable_telemetry   = false
}

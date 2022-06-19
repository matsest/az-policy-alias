# Azure Policy Aliases

This website is made to make it easier to quickly find and search for [Azure Policy Aliases](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#aliases).

This site is made by [@matsest](https://github.com/matsest) and have no affliations with Microsoft.

## Usage

Use the search field to search for a resource type (example: `Storage Accounts`) or a resource property (example: `properties.accountType`).

Alternatively you can browse the sidebar, find the relevant namespace and filter on the relevant resource type.

**Example Alias**

| Default Path             | Alias                                           |
| ------------------------ | ----------------------------------------------- |
| `properties.accountType` | `Microsoft.Storage/storageAccounts/accountType` |

The default path corresponds to the path given in the [resource specification](https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep) (e.g. in an ARM or Bicep file), while the alias is the corresponding field to use in your Azure Policy definition.

## Background

For reasons unknown finding policy aliases is normally done through either

1. `Get-AzPolicyAlias` in PowerShell or equivalent in Azure CLI
2. Azure Policy Visual Studio Code extension

Both of these approaches are relatively slow and requires several commands and steps to carry out.

This web site instead uses the `Get-AzPolicyAlias` cmdlet to generate the full docs and is run once every day to always have a full list of searchable policy aliases.

## More information

Find more information on [GitHub](https://github.com/matsest/az-policy-alias).

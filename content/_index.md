# Azure Policy Aliases

[![last updated](https://img.shields.io/github/last-commit/matsest/az-policy-alias/gh-pages?color=blue&label=last%20updated&logo=powershell&logoColor=white)](https://github.com/matsest/az-policy-alias/commits/gh-pages)

This website is made to make it easier to quickly find and search for supported [Azure Policy Aliases](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#aliases) to use when authoring custom Azure Policy definitions. Available aliases are [automatically updated every day](#more-information).

This site is made by [@matsest](https://github.com/matsest) and have no affliations with Microsoft.

## Usage

Use the search field to search for a resource type (e.g. `Storage Accounts`) or a resource property (e.g. `properties.accountType`).

Alternatively you can browse the sidebar, find the relevant provider namespace and filter on the relevant resource type.

**Example Alias (from [Storage Accounts](Microsoft.Storage/storageAccounts))**

| Default Path             | Alias                                           |
| ------------------------ | ----------------------------------------------- |
| `properties.accountType` | `Microsoft.Storage/storageAccounts/accountType` |

The default path corresponds to the path given in the [resource specification](https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep) (e.g. in an ARM or Bicep file), while the alias is the corresponding field to use in your Azure Policy definition.

## Background

For reasons unknown finding supported policy aliases is normally done through either PowerShell/Azure CLI or VS Code Extension.

Both of these approaches requires additional tooling setup, and multiple commands/steps to carry out. They also requires you to be signed-in to Azure just for finding out if an alias is available. Why not just a searchable reference documentation instead?

This web site uses the `Get-AzPolicyAlias` cmdlet to generate the full overview of all supported policy aliases and is run once every day to always have a full list of up-to-date searchable policy aliases in a small, static web site.

## Related

- [AzAdvertizer.net](https://www.azadvertizer.net/) by [@JulianHayward](https://github.com/JulianHayward): Release and change tracking on Azure Governance capabilities, including policy aliases

## More information

Find more information on [GitHub](https://github.com/matsest/az-policy-alias).

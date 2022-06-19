# Azure Policy Aliases

This repo contains code for a website that makes it easier to quickly find and search for [Azure Policy Aliases](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#aliases).

This repo is made by me and have no affliations with Microsoft.

## Usage

Go to https://policyalias.mats.codes

## Background

For reasons unknown finding policy aliases is normally done through either PowerShell/Azure CLI or VS Code Extension.

Both of these approaches are relatively slow and requires several commands and steps to carry out.

This web site instead uses the `Get-AzPolicyAlias` cmdlet to generate the full docs and is run once every day to always have a full list of searchable policy aliases in a small, static web site.

## Technology

- Azure PowerShell for indexing all available policy aliases
- Hugo with GeekDocs theme for web site
- GitHub Pages for hosting
- GitHub Actions for deployment

## License

[MIT License](LICENSE)

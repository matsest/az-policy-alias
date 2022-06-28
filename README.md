# Azure Policy Aliases

[![latest alias update](https://img.shields.io/github/last-commit/matsest/az-policy-alias/gh-pages?color=red&label=latest%20alias%20update&logo=powershell&logoColor=white)](https://github.com/matsest/az-policy-alias/commits/gh-pages)
[![update-and-deploy](https://github.com/matsest/az-policy-alias/actions/workflows/deploy.yaml/badge.svg?branch=main)](https://github.com/matsest/az-policy-alias/actions/workflows/deploy.yaml)
[![deploy-github-pages](https://github.com/matsest/az-policy-alias/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/matsest/az-policy-alias/actions/workflows/pages/pages-build-deployment)
[![Hugo Version](https://img.shields.io/badge/hugo-0.92-blue.svg)](https://gohugo.io)
[![License](https://img.shields.io/github/license/matsest/az-policy-alias)](https://github.com/thegeeklab/hugo-geekdoc/blob/main/LICENSE)

This repo contains code for a website that makes it easier to quickly find and search for [Azure Policy Aliases](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#aliases) to use when authoring custom Azure policy definitions.

This repo is made by me and have no affliations with Microsoft.

## Usage

Go to https://policyalias.mats.codes

## Background

For reasons unknown finding supported policy aliases is normally done through either PowerShell/Azure CLI or VS Code Extension.

Both of these approaches requires additional tooling setup, and multiple commands/steps to carry out. They also requires you to be signed-in to Azure just for finding out if an alias is available. Why not just a searchable reference documentation instead?

This web site uses the `Get-AzPolicyAlias` cmdlet to generate the full overview of all supported policy aliases and is run once every day to always have a full list of up-to-date searchable policy aliases in a small, static web site.

You can see the latest updated aliases in the [gh-pages branch](https://github.com/matsest/az-policy-alias/commits/gh-pages).

## Technology

- Azure PowerShell for indexing all available policy aliases
- Hugo with GeekDocs theme for web site
- GitHub Pages for hosting
- GitHub Actions for deployment

## Related

- [AzAdvertizer.net](https://www.azadvertizer.net/) by @JulianHayward: Release and change tracking on Azure Governance capabilities, including policy aliases

## License

[MIT License](LICENSE)

# Based on originial by https://github.com/maciejporebski/azure-policy-aliases/blob/master/src/Get-ResourceAliases.ps1 (maciejporebski)

$repoRoot = & git rev-parse --show-toplevel
$basePath = "$repoRoot/content"
if (!(Test-Path -Path $basePath)) {
    New-Item -Path $repoRoot -Name 'content' -ItemType "directory" | Out-Null
}

$menuDataFile = "$repoRoot/data/menu/main.yaml"

$menuContent = @"
---
main:

"@

# Find providers
$resourceTypes = Get-AzPolicyAlias -ListAvailable
$providers = $resourceTypes | Group-Object -Property Namespace

#$content = "# Azure Policy Aliases`n"

foreach ($provider in $providers) {
    $resourceTypesWithAliases = $provider.Group | Where-Object { $_.Aliases.Count -gt 0 }

    if ($resourceTypesWithAliases.Count -gt 0) {
        #$content += "## $($provider.Name)`n`n"

        $namespacePath = "$($basePath)/$($provider.Name)"
        if (!(Test-Path -Path $namespacePath)) {
            New-Item -Path $basePath -Name $provider.Name -ItemType "directory" | Out-Null
        }
        $namespaceTocPath = "$($namespacePath)/_index.md"
        if (!(Test-Path -Path $namespaceTocPath)) {
            New-Item -Path $namespacePath -Name "_index.md" -ItemType "file" | Out-Null
        }

        $menuContent += "  - name: $($provider.Name)`n    ref: '/$($provider.Name)'`n"
        $tocContent = "## Resource Types`n`n" # must be an empty line
        
        foreach ($resourceType in $resourceTypesWithAliases) {
            $resourceString = "$($resourceType.Namespace)/$($resourceType.ResourceType)"
            $resourceMarkdown = "Link to resource definition: [``$resourceString``](https://docs.microsoft.com/en-us/azure/templates/$($resourceString.ToLower()))`n`n"
            $resourceMarkdown += "| Default Path | Alias |`n|---|---|`n"
            foreach ($alias in $resourceType.Aliases) {
                $resourceMarkdown += "| ``$($alias.DefaultPath)`` | ``$($alias.Name)`` |`n"
            }
            $fileName = $resourceType.ResourceType.Replace("/", "-")
            $filePath = "$($namespacePath)/$($fileName).md"
            $resourceMarkdown | Out-File -FilePath $filePath

            #$content += "- [$($resourceType.Namespace)/$($resourceType.ResourceType)]($filePath)`n"
            $tocContent += "- [$($resourceType.Namespace)/$($resourceType.ResourceType)]($fileName)`n"
        }
        $tocContent | Out-File -FilePath $namespaceTocPath

        #$content += "`n"

        #$content | Out-File -FilePath "$basePath/README.md"
    }
}

$menuContent | Out-File -FilePath $menuDataFile
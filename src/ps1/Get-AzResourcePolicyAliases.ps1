# Based on originial by https://github.com/maciejporebski/azure-policy-aliases/blob/master/src/Get-ResourceAliases.ps1 (maciejporebski)

$repoRoot = & git rev-parse --show-toplevel
$basePath = "$repoRoot/docs"
if (!(Test-Path -Path $basePath)) {
    New-Item -Path $repoRoot -Name 'docs' -ItemType "directory" | Out-Null
}

# Find providers
$resourceTypes = Get-AzPolicyAlias -ListAvailable
$providers = $resourceTypes | Group-Object -Property Namespace

$content = "# Azure Policy Aliases`n"

foreach ($provider in $providers) {
    $resourceTypesWithAliases = $provider.Group | Where-Object { $_.Aliases.Count -gt 0 }

    if ($resourceTypesWithAliases.Count -gt 0) {
        $content += "## $($provider.Name)`n"

        $namespacePath = "$($basePath)/$($provider.Name)"
        if (!(Test-Path -Path $namespacePath)) {
            New-Item -Path $basePath -Name $provider.Name -ItemType "directory" | Out-Null
        }

        foreach ($resourceType in $resourceTypesWithAliases) {
            $resourceMarkdown = "# $($resourceType.Namespace)/$($resourceType.ResourceType)`n`n"
            $resourceMarkdown += "| Default Path | Alias |`n|---|---|`n"
            foreach ($alias in $resourceType.Aliases) {
                $resourceMarkdown += "| ``$($alias.DefaultPath)`` | ``$($alias.Name)`` |`n"
            }
            $fileName = $resourceType.ResourceType.Replace("/", "-")
            $filePath = "$($namespacePath)/$($fileName).md"
            $resourceMarkdown | Out-File -FilePath $filePath

            $content += "- [$($resourceType.Namespace)/$($resourceType.ResourceType)]($filePath)`n"
        }

        $content += "`n"

        $content | Out-File -FilePath "$basePath/README.md"
    }
}
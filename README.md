<details><summary>Setup</summary><p>

Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

Install [Bicep CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)

Install [Azure Az PowerShell module](https://learn.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-9.1.0)

Install [Bicep VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)

```
az deployment sub create --name Deploy$(Get-Date -Format 'yyyy-MM-dd') --location swedencentral --template-file main.bicep --parameters prod.bicepparam
```
</p></details> 

<details><summary>Info</summary><p>

[Abbreviation examples for Azure resources](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

[Naming rules and restrictions for Azure resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)

</p></details> 

## Content

| Name | Description | 
|--|--|
| template01 | A virtual machine with bastion 



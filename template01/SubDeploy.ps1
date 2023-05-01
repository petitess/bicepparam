Clear-Host

Connect-AzAccount
Set-AzContext -Subscription
Get-AzContext
Get-AzSubscription

Set-Location 'C:\Users\$env:username'

az account show

az az deployment sub validate

az deployment sub create --name Deploy$(Get-Date -Format 'yyyy-MM-dd') --location swedencentral --template-file main.bicep --parameters prod.bicepparam

#
# deploy.ps1
#

#Login-AzureRmAccount
$subscriptionId = '3a4af7b3-b7ac-463d-9940-1d80445961a8'
Set-AzureRmContext -SubscriptionId $subscriptionId
$timestamp = Get-Date -Format "yyyy-MM-dd_hh-mm-ss"
$resourceGroupName = 'GCbluePrintUserAQ'
$parametersFile='.\azuredeploy.parameters.json'

#
# Provision Basic Services / OMS Workspaces
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName $resourceGroupName `
-TemplateFile .\azuredeploy.json -TemplateParameterFile $parametersFile `
-Mode Incremental -Verbose 
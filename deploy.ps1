
#
# deploy.ps1
#

#Login-AzureRmAccount
$subscriptionId = '60b6165a-8669-47a2-860c-6ef475127364'
Set-AzureRmContext -SubscriptionId $subscriptionId
$timestamp = Get-Date -Format "yyyy-MM-dd_hh-mm-ss"
$resourceGroupName = 'GCbluePrintUser01'
$parametersFile='.\azuredeploy.parameters.json'

#
# Provision Basic Services / OMS Workspaces
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName $resourceGroupName `
-TemplateFile .\azuredeploy.json -TemplateParameterFile $parametersFile `
-Mode Incremental -Verbose 

#
# deploy.ps1
#

#Login-AzureRmAccount
#$subscriptionId = '60b6165a-8669-47a2-860c-6ef475127364'
#Set-AzureRmContext -SubscriptionId $subscriptionId
$timestamp = Get-Date -Format "yyyy-MM-dd_hh-mm-ss"
$resourceGroupName = 'GCbluePrintUser04'
$parametersFile='.\azuredeploy.parameters.json'

#
# Provision Basic Services / OMS Workspaces - ~ 1 hour
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName $resourceGroupName `
-TemplateFile .\azuredeploy01.json -TemplateParameterFile $parametersFile `
-Mode Incremental

#
# More stuff except for SQL - ~ 26 minutes
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName $resourceGroupName `
-TemplateFile .\azuredeploy02.json -TemplateParameterFile $parametersFile `
-Mode Incremental

#
# SQL - ~ 1 hr
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName $resourceGroupName `
-TemplateFile .\azuredeploy03.json -TemplateParameterFile $parametersFile `
-Mode Incremental
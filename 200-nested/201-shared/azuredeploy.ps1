# Login to your subscription
Login-AzureRmAccount

# Variables
$ResourceGroupLocation = "West Europe"
$ResourceGroupName = "MyResourceGroup"
$RepositoryPath = "https://raw.githubusercontent.com/marcvaneijk/ARM-Templates/master/200-nested/201-shared-complex-objects/"

#Variables, constructing
$TemplateFile = $RepositoryPath + "azuredeploy.json"
$TemplateParameterFile = $RepositoryPath + "azuredeploy.parameters.json"
$DeploymentName = (Get-ChildItem $TemplateFile).BaseName + ((get-date).ToUniversalTime()).ToString('MMddyyyyHHmmss')

# Create new Resource Group
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation

# New Resource Group Deployment
New-AzureRmResourceGroupDeployment -Name $DeploymentName -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParameterFile

# Get Resource Group Deployments
Get-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName | ft DeploymentName, ProvisioningState
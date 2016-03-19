Login-AzureRmAccount

## Get current PolicyDefinitions
Get-AzureRmPolicyDefinition | ft name, properties

## Remove PolicyDefinition
Get-AzureRmPolicyDefinition -Name "myPolicyDefinition" | Remove-AzureRmPolicyDefinition -Force

## Get current PolicyAssignment
Get-AzureRmPolicyAssignment

## New PolicyDefinition
$PolicyDefinition = New-AzureRmPolicyDefinition -Name myPolicyDefinition -Description "Allow resource to be deployed only in North and West Europe" -Policy "C:\SecurityPolicies\location.json" -DisplayName myPolicyDefinition

## The PolicyRule in the definition seems empty
Get-AzureRmPolicyDefinition -Name "myPolicyDefinition"

## Get the PolicyRule by defining a variable
$PolicyDefinition = Get-AzureRmPolicyDefinition -Name "myPolicyDefinition"
$PolicyDefinition.Properties.PolicyRule

## Asign a PolicyDefinition
$Subscription = Get-AzureRmSubscription -SubscriptionName "Developer Program Benefit"
$ResourceGroup = "security.policies"

New-AzureRmPolicyAssignment -Name myPolicyAssignment -PolicyDefinition $PolicyDefinition -Scope /subscriptions/$Subscription/resourceGroups/$ResourceGroup

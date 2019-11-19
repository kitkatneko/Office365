## https://docs.microsoft.com/en-us/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell

## Connect
Install-Module -Name MSCommerce 
Import-Module -Name MSCommerce 
Connect-MSCommerce 

## Verify service status
Get-MSCommercePolicy -PolicyId AllowSelfServicePurchase 

## Verify product status
Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase 

## Disable individual products with id from Get-MSCommerceProductPolicies output
## powerapps
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId CFQ7TTC0KP0P -Enabled $False
## power bi pro
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId CFQ7TTC0KP0N -Enabled $False 
## power automate
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId CFQ7TTC0L3PB -Enabled $False


## or disable everthing at once
Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase | forEach { 
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId $_.ProductID -Enabled $false  }


## or enable everything again
Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase | forEach { 
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId $_.ProductID -Enabled $true  }

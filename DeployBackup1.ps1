$alias = Read-Host "Please enter your alias"
$resourceGroupName = Read-Host "Please enter resource group used for lab"
Write-Host "Please enter the region for deployment"
Write-Host "APAC:"
Write-Host "1. eastasia"
Write-Host "2. southeastasia"
Write-Host "EMEA:"
Write-Host "3. northeurope"
Write-Host "4. westeurope"
Write-Host "NA/SA:"
Write-Host "5. centralus"
$rGL = Read-Host "Please enter number for region"
$resourceGroupLocation = (@("eastasia","southeastasia","northeurope","westeurope","centralus"))[$rGL-1]

# Create the resource group only when it doesn't already exist
if ((Get-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Verbose -ErrorAction SilentlyContinue) -eq $null) {
    New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Verbose -Force -ErrorAction Stop
}

Write-Host "Deployment Started" -ForegroundColor Cyan
$name = ($resourceGroupName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm'))

New-AzResourceGroupDeployment -Name $name -ResourceGroupName $resourceGroupName -TemplateUri https://raw.githubusercontent.com/amymcel/AppService.Config.Specialist.Backup.1/main/azuredeploy.json -EngineerAlias $alias

$resource = Get-AzResource -Name $alias  -ResourceGroupName $resourceGroupName
$result = Remove-AzResource -ResourceId $resource.ResourceId -Force | Out-Null
$resource = Get-AzResource -Name "GetWebAppOutboundIpAddresses" -ResourceGroupName $resourceGroupName
$result = Remove-AzResource -ResourceId $resource.ResourceId -Force | Out-Null

Write-Host "Deployment Completed" -ForegroundColor Cyan
                                       
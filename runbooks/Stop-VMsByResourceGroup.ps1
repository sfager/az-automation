Param (
	[Parameter(Mandatory=$true)]
	[String]
	$AzureResourceGroup
)

.\Connect-AzureRM.ps1 -CredentialAssetName "Automator"

Write-Output "Stopping VMs in '$($AzureResourceGroup)' resource group"
	
Get-AzureRmVM -ResourceGroupName $AzureResourceGroup | ForEach-Object {
	
	Write-Output "Stopping '$($_.Name)' ..."
	Stop-AzureRmVM -ResourceGroupName $AzureResourceGroup -Name $_.Name -Force
}
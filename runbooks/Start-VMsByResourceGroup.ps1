Param (
	[Parameter(Mandatory=$true)]
	[String]
	$AzureResourceGroup
)

.\Connect-AzureRM.ps1 -CredentialAssetName "Automator"

Write-Output "Starting VMs in '$($AzureResourceGroup)' resource group"
	
Get-AzureRmVM -ResourceGroupName $AzureResourceGroup | ForEach-Object {
	
	Write-Output "Starting '$($_.Name)' ..."
	Start-AzureRmVM -ResourceGroupName $AzureResourceGroup -Name $_.Name
}
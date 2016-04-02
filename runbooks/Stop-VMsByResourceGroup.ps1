Param (
	[Parameter(Mandatory=$true)]
	[String]
	$AzureResourceGroup
)

#The name of the Automation Credential Asset
$CredentialAssetName = "Automator"

#Get the credential with the above name from the Automation Asset store
$Cred = Get-AutomationPSCredential -Name $CredentialAssetName
if (!$Cred) {
	Throw "Could not find an Automation Credential Asset named '${CredentialAssetName}'. Make sure you have created one in this Automation Account."
}

#Connect to Azure Account
Add-AzureRmAccount -Credential $Cred

Write-Output "Stopping VMs in '$($AzureResourceGroup)' resource group"
	
Get-AzureRmVM -ResourceGroupName $AzureResourceGroup | ForEach-Object {
	
	Write-Output "Stopping '$($_.Name)' ..."
	Stop-AzureRmVM -ResourceGroupName $AzureResourceGroup -Name $_.Name -Force
}
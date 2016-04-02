Param (
	[Parameter(Mandatory=$true)]
	[String]
	$CredentialAssetName
)

#Get the credential with the above name from the Automation Asset store
$Cred = Get-AutomationPSCredential -Name $CredentialAssetName
if (!$Cred) {
	Throw "Could not find an Automation Credential Asset named '${CredentialAssetName}'. Make sure you have created one in this Automation Account."
}

#Connect to Azure Account
Add-AzureRmAccount -Credential $Cred
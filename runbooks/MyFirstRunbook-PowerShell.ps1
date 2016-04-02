Param(
	[Parameter(Mandatory=$true)]
	[string]
	$VMName,
		
	[Parameter(Mandatory=$true)]
	[string]
	$ResourceGroupName
)

# Connection Azure Account
$Credential = Get-AutomationPSCredential -Name 'Automator'
Add-AzureRMAccount -Credential $Credential

# Start virtual machine
Start-AzureRmVM `
		-Name $VMName `
		-ResourceGroupName $ResourceGroupName
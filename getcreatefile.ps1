##########################################
#### Enable unsigned scripts to run #####
#### set-executionpolicy remotesigned ####
######################################


$Path = Read-Host -Prompt "Path to recursively search"


$StartDate = Read-Host -Prompt "Start creation date.Format = 2017-06-16T16:36:07" 
$EndDate = Read-Host -Prompt "End creation date"



Get-ChildItem $Path -recurse -include @("*") | Where-Object {$_.CreationTime -gt $StartDate -and $_.CreationTime -lt "$EndDate"} | Select-Object FullName, CreationTime, @{Name="Mbytes";Expression={$_.Length/1Kb}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}} |Export-Csv .\FileCreation_$StartDate_.txt
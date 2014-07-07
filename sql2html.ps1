if(!(get-module|Where-Object{$_.Name -eq "SQLPS"})){
Import-Module SQLPS -DisableNameChecking
}

Set-Location SQLSERVER:\SQL\WINDOWS-2GRP5NF\SQLSAT

#running methods
#region

cd JobServer\Jobs
Get-ChildItem

#fails
Get-Item report1



#endregion

#invoke-sql
#region
$sql = @"
select top 200 City, StateProvinceID, PostalCode from AdventureWorks2012.Person.Address;
"@

$output = Invoke-Sqlcmd -Query $sql -SuppressProviderContextWarning

$css = @"
<style>
body {
	font-family:Ariel;
	font-size:24pt;
}
th {
	background-color:black;
	color:white;
}
td {
	background-color:#666;
	color:#FFF;
}
</style>
"@
$output|select City, StateProvinceID, PostalCode|ConvertTo-Html -Head $css -Title "Addresses" -precontent "<h1>Report</h1><h2>AdventureWorks Addresses</h2>"|Out-File E:\temp\persons.html

#endregion
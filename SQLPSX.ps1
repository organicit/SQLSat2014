#import-module SQLPSX

#create sql server object and set it to variable
$xSqlServer = Get-SqlServer $env:COMPUTERNAME"\SQLSAT"


$locDBs = Get-SqlDatabase -sqlserver $xSqlServer
$adWorksDb = $locDBs|Where-Object {$_.Name -eq "AdventureWorks2012"}

#
$dataFiles = Get-SqlDatabase -sqlserver $xSqlServer|Get-sqldatafile

$logFiles = Get-SqlDatabase -sqlserver $xSqlServer|Get-sqllogfile

$logFiles.FileName

$dataFiles.FileName


#create and restore a backup then drop the DB
#region

Invoke-SqlBackup $xSqlServer $adWorksDb.Name "E:\temp\AdventureWorks2012.bak"

Invoke-SqlRestore $xSqlServer "ADTESTRESTORE" "E:\temp\AdventureWorks2012.bak" `
           -relocatefiles @{AdventureWorks2012_Data='E:\RESTORE\AdventureWorks2012_Data.mdf'; AdventureWorks2012_Log='E:\RESTORE\AdventureWorks2012_Data.ldf'} -force

Remove-SqlDatabase $xSqlServer.Name "ADTESTRESTORE"

#endregion
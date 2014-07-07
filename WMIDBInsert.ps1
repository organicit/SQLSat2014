import-module SQLPSX
$xSqlServer = Get-SqlServer $env:COMPUTERNAME"\SQLSAT"


$compInfo = Get-WmiObject -Class Win32_ComputerSystem
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
$properties = @{'OSBuild' = $osInfo.BuildNumber;
            'OSVersion' = $osInfo.version;
            'OSArch'    = $osInfo.OSArchitecture;
            'TotalMem'  = [Math]::Round($compInfo.TotalPhysicalMemory / 1GB,2);
            'CompName'  = $osInfo.PSComputerName}

$object = New-Object -TypeName PSObject -Property $properties

$sqlcmd = @"
INSERT INTO dbo.CompanyServer 
(BuildNumber, OSVersion, OSArchitecture, TotalMemory, ServerName)
VALUES 
('$($object.OSBuild)','$($object.OSVersion)', '$($object.OSArch)', '$($object.TotalMem)', '$($object.CompName)' )
"@


Set-SqlData $xSqlServer "CDB" $sqlcmd
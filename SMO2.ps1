$nodeName = $env:COMPUTERNAME + "\SQLSAT"
 $assemblylist = 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ConnectionInfo.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SmoExtended.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Smo.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Dmf.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SqlWmiManagement.dll",  
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.Sdk.Sfc.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SqlEnum.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.RegSvrEnum.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.WmiEnum.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ServiceBrokerEnum.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ConnectionInfoExtended.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.Collector.dll", 
    "C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.CollectorEnum.dll"
    foreach ($asm in $assemblylist){add-type -Path "$asm"}

$sqlSrv = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $nodeName
$db = New-Object ('Microsoft.SqlServer.Management.Smo.Database')
$db = $sqlSrv.Databases.Item("AdventureWorks2012")
foreach($table in $db.Tables){$table.Name}

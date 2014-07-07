$nodeName = $env:COMPUTERNAME
 $assemblylist = 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ConnectionInfo.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SmoExtended.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Smo.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Dmf.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SqlWmiManagement.dll",  
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.Sdk.Sfc.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SqlEnum.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.RegSvrEnum.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.WmiEnum.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ServiceBrokerEnum.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.ConnectionInfoExtended.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.Collector.dll", 
    "C:\Program Files\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Management.CollectorEnum.dll"
    foreach ($asm in $assemblylist){add-type -Path "$asm"}

$sqlSrv = New-Object Microsoft.SqlServer.Management.Smo $nodeName
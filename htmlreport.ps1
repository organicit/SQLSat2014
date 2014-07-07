
$winHosts = $env:COMPUTERNAME
$objTemplateObject = New-Object psobject
$objTemplateObject | Add-Member -MemberType NoteProperty -Name ComputerName -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name Manufacturer -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name Model -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name TotalPhysMem -Value $null
 
$objResults = $winHosts, $winHosts, $winHosts
 
foreach($z in $winHosts){
    $objTemp = $objTemplateObject | Select-Object *
 
    $status = Test-Connection -Count 1 -ComputerName $z -Quiet
   
    if($status){
        $resultCS = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $z 2> $null
        if ($?)
        {
       
           $objTemp.Computername = $resultCS.Name
           $objTemp.Manufacturer = $resultCS.Manufacturer
           $objTemp.Model = $resultCS.Model
           $objTemp.TotalPhysMem = "{0:N0}" -f($resultCS.TotalPhysicalMemory/1GB)
 
           $objResults += $objTemp
           
        }
        else
        {
            [console]::WriteLine("{0} is not accessible ", $z)
        }
    }
}



$objResults|sort Computername | ConvertTo-Html > E:\TEMP\HOST_REPORT.html

$IE = New-Object -ComObject internetexplorer.application
$IE.navigate2("E:\temp\HOST_REPORT.html")
$IE.visible=$true
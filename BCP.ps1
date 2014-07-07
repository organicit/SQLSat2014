if(!(get-module|Where-Object{$_.Name -eq "SQLPS"})){
Import-Module SQLPS -DisableNameChecking
}

[Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")
$Compression = [System.IO.Compression.CompressionLevel]::Optimal
$IncludeBaseDirectory = $false

$dbRoot = "SQLSERVER:\SQL\WINDOWS-2GRP5NF\SQLSAT\Databases\AdventureWorks2012\"
$BCPDir = "E:\Temp\BCP\"
$date = get-date -Format "MMddyyHHmm"
$BCPLog = $BCPDir + "BCP_$date.log"

cd $dbRoot"Tables"
$BCPTables = dir|where-object {$_.Schema -eq "Person"}


foreach($Table in $BCPTables.Name)
{
    $BCPFileName = "$BCPDir$Table-n.txt"
    
    "Starting BCP on Table $Table : $(Get-date)"|out-file $BCPLog -Append
    BCP AdventureWorks2012.Person.$Table OUT $BCPFileName -Slocalhost\SQLSAT -n -Pwelcome -UBCPUser
    "BCP for Table $Table completed: $(Get-date)"|out-file $BCPLog -Append
    "***********************************************"|out-file $BCPLog -Append
}


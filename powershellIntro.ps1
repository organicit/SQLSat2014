#help
#region

Get-Help

get-help Invoke-WebRequest -full

get-help Invoke-WebRequest -showWindow

Get-Help Invoke-WebRequest -Online

update-help

#endregion

#Get-Member
#region
$procs = Get-Process

$procs | Get-Member

$singleProc = $procs | Where-Object { $_.Name -eq "sqlbrowser"}

$singleProc.StartInfo|get-member

$singleProc.StartInfo.EnvironmentVariables

#endregion

#Get-Module
#region

Get-Module -ListAvailable

#endregion


#Get-Command
#region

Get-Command 

Get-Command -Verb "Get"

Get-Command -Noun "Variable"

#endregion

#pipelining
#region

start-process notepad -WindowStyle Minimized

Get-Process -Name notepad

get-help Stop-Process -full

Get-Process -Name notepad|Stop-Process

####################

for(1..3){start-process notepad -WindowStyle Minimized}

Get-Process -Name notepad|select Id|ft -AutoSize

get-help Stop-Process -full

Get-Process -Name notepad|select Id|Stop-Process

#endregion
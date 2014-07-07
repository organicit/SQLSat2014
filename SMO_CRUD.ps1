
function get-randomvalue {
$randomObj = New-Object System.Random
$randString=""
1..12 | ForEach { $randString = $randString + [char]$randomObj.next(97,121) }
$randString
sleep 1
}

#Insert Data
#region

$sqlSrv = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $nodeName
$db = $sqlSrv.Databases["AdventureWorks2012"]
$insertSql = @"
    INSERT INTO HumanResources.Department
        (Name, GroupName)
    VALUES
        ('$(get-randomvalue)', 'Research and Development')
        ,('$(get-randomvalue)', 'Research and Development')
        ,('$(get-randomvalue)', 'Research and Development')
        ,('$(get-randomvalue)', 'Research and Development')
"@

$db.ExecuteNonQuery($insertSql)

#endregion

#Select Data
#region
$selectSql = @"
SELECT TOP 1000 [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[HumanResources].[Department]
"@

#Returns a Data Table, could also be a Data Set
$data = $db.ExecuteWithResults($selectSql)

$dt = New-Object "System.Data.DataTable"
$dt = $data.Tables[0]

#show our rows returned
$dt | Format-Table -AutoSize

#endregion


#Update Data
#region
$updateSQL = @"
UPDATE [AdventureWorks2012].[HumanResources].[Department]
SET NAME = '$(get-randomvalue)'
WHERE DepartmentID = '4'
"@


$db.ExecuteNonQuery($updateSql)


$qryUpdate = @"
    SELECT * from [AdventureWorks2012].[HumanResources].[Department]
    WHERE DepartmentID = '4'
"@


#Returns a Data Table, could also be a Data Set
$data = $db.ExecuteWithResults($qryUpdate)

$data.Tables[0] | Format-Table -AutoSize

#endregion
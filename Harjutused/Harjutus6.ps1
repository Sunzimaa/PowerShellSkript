# Loo CSV fail ja salvesta see kohalikku arvutisse
$csvContent = @"
Name,Age
John,8
Joe,12
Mary,7
Tom,15
Lily,16
Emily,9
"@
$csvPath = "C:\Temp\students.csv"
$csvContent | Out-File -FilePath $csvPath -Encoding UTF8

# Impordi CSV PowerShelli
$csv = Import-Csv -Path $csvPath

# Loo tulemustabel
$result = @()
foreach ($c in $csv) {
    if ([int]$c.Age -ge 4 -and [int]$c.Age -le 10) {
        $school = "Junior"
    } elseif ([int]$c.Age -ge 11 -and [int]$c.Age -le 17) {
        $school = "Senior"
    } else {
        $school = "Unknown"
    }
    $temp = [PSCustomObject]@{
        Name = $c.Name
        School = $school
    }
    $result += $temp
}

# Kuvab tulemustabel
Write-Host "Resulting Table:"
$result | Format-Table -AutoSize

# Ekspordi tulemustabel uude CSV faili
$result | Export-Csv -Path "C:\Temp\students_with_school.csv" -NoTypeInformation -Encoding UTF8
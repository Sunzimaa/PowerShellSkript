# Hashtable 1: DaysWorked
$daysWorked = @{
    John = 12
    Joe = 20
    Mary = 18
}

# Hashtable 2: SalaryPerDay
$salaryPerDay = @{
    John = 100
    Joe = 120
    Mary = 150
}

# Hashtable 3: Salary (DaysWorked * SalaryPerDay)
$salary = @{}

foreach ($name in $daysWorked.Keys) {
    $salary[$name] = $daysWorked[$name] * $salaryPerDay[$name]
}

# Output
Write-Output "DaysWorked:"
$daysWorked

Write-Output "SalaryPerDay:"
$salaryPerDay

Write-Output "Salary:"
$salary
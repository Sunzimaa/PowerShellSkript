# i. Ask the user for 2 values and compare them
$value1 = Read-Host "Enter the first value"
$value2 = Read-Host "Enter the second value"

if ($value1 -gt $value2) {
    Write-Host "The higher number is: $value1"
} elseif ($value2 -gt $value1) {
    Write-Host "The higher number is: $value2"
} else {
    Write-Host "Both numbers are equal."
}

# ii. Display the menu and ask the user to select the country
Write-Host "Select a country:"
Write-Host "1. Germany"
Write-Host "2. China"
Write-Host "3. Sweden"
Write-Host "4. Bulgaria"

$choice = Read-Host "Enter the number corresponding to the country"

switch ($choice) {
    1 { Write-Host "The capital of Germany is: Berlin" }
    2 { Write-Host "The capital of China is: Hong Kong" }
    3 { Write-Host "The capital of Sweden is: Stockholm" }
    4 { Write-Host "The capital of Bulgaria is: Sofia" }
    default { Write-Host "Invalid choice." }
}
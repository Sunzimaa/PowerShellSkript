Function Get-ServiceCount {
    $running = (Get-Service | Where-Object { $_.Status -eq "Running" }).Count
    $stopped = (Get-Service | Where-Object { $_.Status -eq "Stopped" }).Count

    Write-Host "Total Running Services: $running"
    Write-Host "Total Stopped Services: $stopped"
}

# Kutsume funktsiooni välja
Get-ServiceCount

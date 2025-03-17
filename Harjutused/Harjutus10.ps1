$count = 0  # Loendur, mitu korda sõnum on kuvatud

Do {
    # Kontrollib, kas Notepad töötab
    $notepadProcesses = Get-Process -Name notepad -ErrorAction SilentlyContinue

    if ($notepadProcesses) {
        Write-Host "Notepad is running..."
        $count++  # Suurendab loendurit
        Start-Sleep -Seconds 1  # Ootab 1 sekundi
    }
} Until (-not $notepadProcesses)  # Kuni Notepad EI tööta, tsükkel peatub

Write-Host "All Notepad instances are closed."
Write-Host "The statement was displayed $count times."

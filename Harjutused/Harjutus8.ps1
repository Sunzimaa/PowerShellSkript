Do {
    # Kontrollib, kas Notepad töötab
    $notepadProcesses = Get-Process -Name notepad -ErrorAction SilentlyContinue

    if ($notepadProcesses) {
        Write-Host "Notepad is running..."
        Start-Sleep -Seconds 2  # Ootab 2 sekundit enne järgmist kontrolli
    }
} while ($notepadProcesses)

Write-Host "All Notepad instances are closed. Exiting..."

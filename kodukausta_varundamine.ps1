# Määrab kuupäeva stringi formaadis "yyyyMMdd"
$dateString = Get-Date -Format "yyyyMMdd"

# Varunduste juurkaust
$backupRoot = "C:\Backups"
if (-not (Test-Path -Path $backupRoot)) {
    try {
        New-Item -Path $backupRoot -ItemType Directory -Force | Out-Null
        Write-Host "Created backup root directory: $backupRoot" -ForegroundColor Green
    } catch {
        Write-Error "Error creating backup root directory: $_"
        exit 1
    }
}

# Loob nimekirja kohalikest kasutajatest
$users = Get-LocalUser | Select-Object Name, FullName

foreach ($user in $users) {
    $homePath = "C:\Users\$($user.Name)"
    
    if (Test-Path -Path $homePath) {
        try {
            # Määrab varundusfaili nime ja tee
            $backupFileName = "$($user.Name)_backup_$dateString.zip"
            $backupPath = Join-Path -Path $backupRoot -ChildPath $backupFileName
            
            # Loob varunduse
            Compress-Archive -Path $homePath -DestinationPath $backupPath -Force
            Write-Host "Created backup for user $($user.Name): $backupPath" -ForegroundColor Green
        } catch {
            Write-Error "Error creating backup for user $($user.Name): $_"
        }
    } else {
        Write-Warning "No home folder found for user: $($user.Name) ($($user.FullName))"
    }
}

Write-Host "Backup process completed." -ForegroundColor Cyan
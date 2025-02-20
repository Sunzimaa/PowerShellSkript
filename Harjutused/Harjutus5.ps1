# i. Open two instances of notepad and find their Process ID
$notepadProcesses = Get-Process -Name notepad | Select-Object -Property ProcessName, Id
Write-Host "Notepad Processes:"
$notepadProcesses

# ii. Create a folder and copy files
$folderPath = "C:\Temp\Test"
if (-Not (Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

# Copy sample files (assuming the sample files are in the current directory)
Copy-Item -Path ".\test2.csv" -Destination "$folderPath\test2.csv"

# Show total files in the folder
$totalFiles = Get-ChildItem -Path $folderPath
Write-Host "Total files in the folder:"
$totalFiles

# Find the CSV file and display its size in KB and MB
$csvFile = Get-ChildItem -Path $folderPath -Filter *.csv
$csvFileSizeKB = [math]::Round($csvFile.Length / 1KB, 2)
$csvFileSizeMB = [math]::Round($csvFile.Length / 1MB, 2)

Write-Host "CSV File Size:"
Write-Host "Size in KB: $csvFileSizeKB KB"
Write-Host "Size in MB: $csvFileSizeMB MB"
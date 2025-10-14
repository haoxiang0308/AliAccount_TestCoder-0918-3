# PowerShell script to get process list and save to a file with a random name
$processList = Get-Process
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"
$processList | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"
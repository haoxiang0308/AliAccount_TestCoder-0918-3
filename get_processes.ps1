# PowerShell script to get list of processes and save to a file with random name
$processes = Get-Process
$randomFileName = "processes_" + (Get-Random) + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"
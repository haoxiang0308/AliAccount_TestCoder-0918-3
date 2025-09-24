# PowerShell script to get process list and save to a random file
$randomFileName = "/tmp/process_list_N0eLoZ.txt"
Get-Process | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"
# PowerShell script to get a list of processes and save to a file with a random name

# Generate a random filename
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"

# Get the list of processes and save to the randomly named file
Get-Process | Out-File -FilePath $randomFileName

Write-Output "Process list saved to $randomFileName"
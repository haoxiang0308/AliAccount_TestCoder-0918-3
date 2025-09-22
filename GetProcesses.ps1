# PowerShell script to get list of processes and save to a file with random name

# Generate a random file name
$randomFileName = "processes_" + (Get-Random) + ".txt"

# Get the list of processes
$processes = Get-Process

# Save the processes to the file
$processes | Out-File -FilePath $randomFileName

# Output confirmation
Write-Host "Processes saved to $randomFileName"
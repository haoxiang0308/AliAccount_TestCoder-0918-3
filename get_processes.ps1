# PowerShell script to get list of processes and save to a file with random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName()
$fileName = "$randomName.txt"

# Save the processes to the file
$processes | Out-File -FilePath $fileName

Write-Host "Process list saved to: $fileName"
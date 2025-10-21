# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Get the list of processes and export to the randomly named file
Get-Process | Out-File -FilePath $randomName

Write-Output "Process list saved to $randomName"
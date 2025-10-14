# PowerShell Script to get processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random file name using GUID
$randomFileName = [System.Guid]::NewGuid().ToString() + ".csv"

# Export the processes to the CSV file
$processes | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list saved to $randomFileName"
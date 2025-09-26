# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename using a GUID
$randomFileName = [System.Guid]::NewGuid().ToString() + ".csv"

# Define the output path (saving in the current directory)
$outputPath = Join-Path -Path $PWD -ChildPath $randomFileName

# Export the process list to the CSV file
$processes | Export-Csv -Path $outputPath -NoTypeInformation

Write-Output "Process list exported to $outputPath"
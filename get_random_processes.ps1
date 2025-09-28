# PowerShell script to get processes and save to a file with a random name

# Get the list of processes and convert to a string
$processList = Get-Process | Out-String

# Generate a random file name
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"

# Define the output path (saving in the current directory)
$outputPath = Join-Path $PSScriptRoot $randomFileName

# Write the process list to the file
Set-Content -Path $outputPath -Value $processList

Write-Output "Process list saved to: $outputPath"
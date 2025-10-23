# Generate a random filename
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".csv"

# Get the list of processes and export to the random filename
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list saved to $randomFileName"
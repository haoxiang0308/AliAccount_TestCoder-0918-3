# PowerShell script to get processes and save to a random file
$csvPath = '/tmp/tmp.DfPfHYHHLa.csv'
Get-Process | Export-Csv -Path $csvPath -NoTypeInformation
Write-Host "Process list saved to $csvPath"
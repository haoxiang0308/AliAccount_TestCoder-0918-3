# PowerShell script to get a list of processes and save to a file with a random name
$processes = Get-Process
$randomName = [System.IO.Path]::GetRandomFileName()
$fileName = $randomName + ".csv"
$processes | Export-Csv -Path $fileName -NoTypeInformation
Write-Output "Process list saved to $fileName"
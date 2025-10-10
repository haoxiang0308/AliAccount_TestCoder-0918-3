# PowerShell Script to Get Current User Information
Write-Host "Getting current user information..."
$currentUser = $env:USERNAME
$userDomain = $env:USERDOMAIN

Write-Host "User Domain: $userDomain"
Write-Host "Username: $currentUser"
Write-Output "Full User Identity: $userDomain\$currentUser"
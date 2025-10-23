# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME -and $_.Domain -eq $env:USERDOMAIN}).SID
    HomeDirectory = $env:USERPROFILE
    FullName = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME -and $_.Domain -eq $env:USERDOMAIN}).FullName
    UserPrincipalName = $env:USERDNSDOMAIN ? "$env:USERNAME@$env:USERDNSDOMAIN" : $env:USERNAME
}

# Display current user information
Write-Host "Current User Information:"
Write-Host "Username: $($currentUserInfo.UserName)"
Write-Host "User Domain: $($currentUserInfo.UserDomain)"
Write-Host "Computer Name: $($currentUserInfo.ComputerName)"
Write-Host "User SID: $($currentUserInfo.UserSID)"
Write-Host "Home Directory: $($currentUserInfo.HomeDirectory)"
Write-Host "Full Name: $($currentUserInfo.FullName)"
Write-Host "User Principal Name: $($currentUserInfo.UserPrincipalName)"

# Generate a random filename
$randomFileName = "UserInfo_" + (Get-Random -Maximum 1000000) + ".ps1"

# Create content for the randomly named file
$fileContent = @"
# Saved User Information - Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
`$savedUserInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    FullName = "$($currentUserInfo.FullName -replace '"', '`"')"
    UserPrincipalName = "$($currentUserInfo.UserPrincipalName)"
}

# Display the saved user information
Write-Host "Loaded User Information:"
Write-Host "Username: `$savedUserInfo.UserName"
Write-Host "User Domain: `$savedUserInfo.UserDomain"
Write-Host "Computer Name: `$savedUserInfo.ComputerName"
Write-Host "User SID: `$savedUserInfo.UserSID"
Write-Host "Home Directory: `$savedUserInfo.HomeDirectory"
Write-Host "Full Name: `$savedUserInfo.FullName"
Write-Host "User Principal Name: `$savedUserInfo.UserPrincipalName"
"@

# Save to the randomly named .ps1 file
$fileContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "User information has been saved to: $randomFileName"
# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
Write-Host "Getting current user information..."

# Create a hashtable to store user information
$userInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME' AND Domain='$env:USERDOMAIN'").SID
    HomeDirectory = $env:USERPROFILE
    FullName = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME' AND Domain='$env:USERDOMAIN'").FullName
    DateTime = Get-Date
}

# Display the user information
Write-Host "Current User Information:" -ForegroundColor Green
Write-Host "Username: $($userInfo.UserName)"
Write-Host "Domain: $($userInfo.UserDomain)"
Write-Host "Computer Name: $($userInfo.ComputerName)"
Write-Host "User SID: $($userInfo.UserSID)"
Write-Host "Home Directory: $($userInfo.HomeDirectory)"
Write-Host "Full Name: $($userInfo.FullName)"
Write-Host "Retrieved on: $($userInfo.DateTime)"

# Generate a random filename
$randomNumber = Get-Random -Maximum 1000000
$randomFileName = "UserInfo_$randomNumber.ps1"

# Create the content for the new file
$fileContent = @"
# User Information Script
# Generated on: $($userInfo.DateTime)

`$savedUserInfo = @{
    UserName = '$($userInfo.UserName)'
    UserDomain = '$($userInfo.UserDomain)'
    ComputerName = '$($userInfo.ComputerName)'
    UserSID = '$($userInfo.UserSID)'
    HomeDirectory = '$($userInfo.HomeDirectory)'
    FullName = '$($userInfo.FullName)'
    DateTime = '$($userInfo.DateTime)'
}

Write-Host "Saved User Information:" -ForegroundColor Green
Write-Host "Username: `$savedUserInfo.UserName"
Write-Host "Domain: `$savedUserInfo.UserDomain"
Write-Host "Computer Name: `$savedUserInfo.ComputerName"
Write-Host "User SID: `$savedUserInfo.UserSID"
Write-Host "Home Directory: `$savedUserInfo.HomeDirectory"
Write-Host "Full Name: `$savedUserInfo.FullName"
Write-Host "Retrieved on: `$savedUserInfo.DateTime"
"@

# Write the content to the randomly named file
$fileContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "User information has been saved to: $randomFileName" -ForegroundColor Yellow
Write-Host "Script execution completed!" -ForegroundColor Green
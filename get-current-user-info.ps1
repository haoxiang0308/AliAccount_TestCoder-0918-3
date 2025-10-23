# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
Write-Host "Collecting current user information..." -ForegroundColor Green

# Create a hashtable to store user information
$userInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME' AND Domain='$env:USERDOMAIN'").SID
    HomeDirectory = $env:USERPROFILE
    FullName = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME' AND Domain='$env:USERDOMAIN'").FullName
    ProfileDirectory = $env:USERPROFILE
    DateCollected = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

# Display the collected information
Write-Host "`nCurrent User Information:" -ForegroundColor Yellow
Write-Host "Username: $($userInfo.UserName)"
Write-Host "Domain: $($userInfo.UserDomain)"
Write-Host "Computer Name: $($userInfo.ComputerName)"
Write-Host "User SID: $($userInfo.UserSID)"
Write-Host "Home Directory: $($userInfo.HomeDirectory)"
Write-Host "Full Name: $($userInfo.FullName)"
Write-Host "Profile Directory: $($userInfo.ProfileDirectory)"
Write-Host "Information Collected On: $($userInfo.DateCollected)"

# Generate a random filename with a 6-digit number
$randomNumber = Get-Random -Minimum 100000 -Maximum 999999
$randomFileName = "UserInfo_$randomNumber.ps1"

# Create content for the new file
$fileContent = @"
# User Information Script
# Generated on: $($userInfo.DateCollected)

`$storedUserInfo = @{
    UserName = '$($userInfo.UserName)'
    UserDomain = '$($userInfo.UserDomain)'
    ComputerName = '$($userInfo.ComputerName)'
    UserSID = '$($userInfo.UserSID)'
    HomeDirectory = '$($userInfo.HomeDirectory)'
    FullName = '$($userInfo.FullName -replace "'", "''")'
    ProfileDirectory = '$($userInfo.ProfileDirectory)'
    DateCollected = '$($userInfo.DateCollected)'
}

Write-Host "Stored User Information:" -ForegroundColor Green
Write-Host "Username: `$storedUserInfo.UserName"
Write-Host "Domain: `$storedUserInfo.UserDomain"
Write-Host "Computer Name: `$storedUserInfo.ComputerName"
Write-Host "User SID: `$storedUserInfo.UserSID"
Write-Host "Home Directory: `$storedUserInfo.HomeDirectory"
Write-Host "Full Name: `$storedUserInfo.FullName"
Write-Host "Profile Directory: `$storedUserInfo.ProfileDirectory"
Write-Host "Information Collected On: `$storedUserInfo.DateCollected"
"@

# Write the content to the randomly named file
$fileContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "`nUser information has been saved to: $randomFileName" -ForegroundColor Cyan
Write-Host "Script execution completed!" -ForegroundColor Green
# PowerShell script to get current user information
Write-Host "Getting current user information..."

# Get current user details
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    HomeDirectory = $env:USERPROFILE
    CurrentDirectory = Get-Location
}

# Display user information
Write-Host "User Information:"
Write-Host "------------------"
Write-Host "Username: $($currentUserInfo.UserName)"
Write-Host "User Domain: $($currentUserInfo.UserDomain)"
Write-Host "Computer Name: $($currentUserInfo.ComputerName)"
Write-Host "Home Directory: $($currentUserInfo.HomeDirectory)"
Write-Host "Current Directory: $($currentUserInfo.CurrentDirectory)"

# Export information to a variable
$UserInfo = $currentUserInfo

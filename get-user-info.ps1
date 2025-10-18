# PowerShell script to get current user information
Write-Host "Getting current user information..."

# Get current user details
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance -ClassName Win32_UserAccount -Filter "Name='$env:USERNAME'").SID
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

# If running on Windows, get additional information
if ($IsWindows -or (Get-Command Get-WMIObject -ErrorAction SilentlyContinue)) {
    try {
        $userDetails = Get-WmiObject -Class Win32_ComputerSystem | Select-Object UserName
        Write-Host "Full User Path: $($userDetails.UserName)"
    }
    catch {
        Write-Host "Could not retrieve additional user details."
    }
}

# Export information to a variable
$UserInfo = $currentUserInfo
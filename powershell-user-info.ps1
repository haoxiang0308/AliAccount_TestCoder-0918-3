<#
.SYNOPSIS
PowerShell script to get current user information and save to a randomly named .ps1 file.

.DESCRIPTION
This script collects various user and system information, displays it,
and then creates a new PowerShell script with random name containing
the same information.

.AUTHOR
Created by the AI assistant

.DATE
October 2025
#>

# Display start message
Write-Host "Collecting current user information..." -ForegroundColor Green

# Collect user information using various methods
try {
    # Get basic user information from environment variables
    $userName = $env:USERNAME
    $userDomain = $env:USERDOMAIN
    $computerName = $env:COMPUTERNAME
    $userProfile = $env:USERPROFILE
    
    # Get additional user information using WMI
    $userAccount = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$userName' AND Domain='$userDomain'"
    $userSID = $userAccount.SID
    $fullName = $userAccount.FullName
    
    # Get network information
    $ipAddresses = (Get-NetIPAddress -AddressFamily IPv4 | 
                   Where-Object {$_.IPAddress -notlike "169.254.*" -and 
                                $_.IPAddress -ne "127.0.0.1" -and
                                $_.InterfaceAlias -notlike "Loopback*"}).IPAddress -join ", "
    
    # Get OS information
    $osInfo = Get-WmiObject -Class Win32_OperatingSystem
    $osVersion = $osInfo.Version
    $osName = $osInfo.Caption
    
    # Create a hashtable to store all information
    $userInfo = @{
        UserName = $userName
        UserDomain = $userDomain
        ComputerName = $computerName
        UserSID = $userSID
        UserProfile = $userProfile
        FullName = $fullName
        IPAddress = $ipAddresses
        OSName = $osName
        OSVersion = $osVersion
        DateCollected = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        TimeZone = (Get-TimeZone).DisplayName
    }
}
catch {
    Write-Error "Error collecting user information: $_"
    exit 1
}

# Display the collected information
Write-Host "`n=== Current User Information ===" -ForegroundColor Yellow
Write-Host "Username: $($userInfo.UserName)"
Write-Host "Domain: $($userInfo.UserDomain)"
Write-Host "Computer Name: $($userInfo.ComputerName)"
Write-Host "User SID: $($userInfo.UserSID)"
Write-Host "User Profile: $($userInfo.UserProfile)"
Write-Host "Full Name: $($userInfo.FullName)"
Write-Host "IP Address: $($userInfo.IPAddress)"
Write-Host "OS Name: $($userInfo.OSName)"
Write-Host "OS Version: $($userInfo.OSVersion)"
Write-Host "Time Zone: $($userInfo.TimeZone)"
Write-Host "Information Collected On: $($userInfo.DateCollected)"
Write-Host "===============================" -ForegroundColor Yellow

# Generate a random filename with a 6-character alphanumeric string
$chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
$randomString = ""
for ($i = 0; $i -lt 6; $i++) {
    $randomString += $chars[(Get-Random -Maximum $chars.Length)]
}
$randomFileName = "UserInfo_$randomString.ps1"

# Create content for the new file
$fileContent = @"
<#
.SYNOPSIS
Saved User Information Script
Generated on: $($userInfo.DateCollected)
#>

# Stored User Information
`$storedUserInfo = @{
    UserName = '$($userInfo.UserName)'
    UserDomain = '$($userInfo.UserDomain)'
    ComputerName = '$($userInfo.ComputerName)'
    UserSID = '$($userInfo.UserSID)'
    UserProfile = '$($userInfo.UserProfile)'
    FullName = '$($userInfo.FullName -replace "'", "''")'
    IPAddress = '$($userInfo.IPAddress)'
    OSName = '$($userInfo.OSName -replace "'", "''")'
    OSVersion = '$($userInfo.OSVersion)'
    TimeZone = '$($userInfo.TimeZone -replace "'", "''")'
    DateCollected = '$($userInfo.DateCollected)'
}

Write-Host "=== Stored User Information ===" -ForegroundColor Green
Write-Host "Username: `$storedUserInfo.UserName"
Write-Host "Domain: `$storedUserInfo.UserDomain"
Write-Host "Computer Name: `$storedUserInfo.ComputerName"
Write-Host "User SID: `$storedUserInfo.UserSID"
Write-Host "User Profile: `$storedUserInfo.UserProfile"
Write-Host "Full Name: `$storedUserInfo.FullName"
Write-Host "IP Address: `$storedUserInfo.IPAddress"
Write-Host "OS Name: `$storedUserInfo.OSName"
Write-Host "OS Version: `$storedUserInfo.OSVersion"
Write-Host "Time Zone: `$storedUserInfo.TimeZone"
Write-Host "Information Collected On: `$storedUserInfo.DateCollected"
Write-Host "===============================" -ForegroundColor Green
"@

# Write the content to the randomly named file
try {
    $fileContent | Out-File -FilePath $randomFileName -Encoding UTF8
    Write-Host "`nUser information has been successfully saved to: $randomFileName" -ForegroundColor Cyan
}
catch {
    Write-Error "Error saving file: $_"
    exit 1
}

Write-Host "Script execution completed!" -ForegroundColor Green
<#
.SYNOPSIS
PowerShell script to get current user information and save to a randomly named .ps1 file.

.DESCRIPTION
This script collects comprehensive user and system information, displays it,
and then creates a new PowerShell script with a random name containing
the same information.

.EXAMPLE
.\demo-user-info.ps1
This will collect user information and create a randomly named .ps1 file with the data.

.NOTES
File Name: demo-user-info.ps1
Author: AI Assistant
Date: October 2025
#>

# Function to get comprehensive user information
function Get-UserInfo {
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
        IPAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -notlike "169.254.*" -and $_.IPAddress -ne "127.0.0.1"}).IPAddress | Select-Object -First 1
        OSVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
        LastBootTime = (Get-WmiObject -Class Win32_OperatingSystem).ConvertToDateTime((Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime)
        TotalPhysicalMemory = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    }

    return $userInfo
}

# Get user information
$userInfo = Get-UserInfo

# Display the collected information
Write-Host "`n=== Current User Information ===" -ForegroundColor Yellow
Write-Host "Username: $($userInfo.UserName)"
Write-Host "Domain: $($userInfo.UserDomain)"
Write-Host "Computer Name: $($userInfo.ComputerName)"
Write-Host "User SID: $($userInfo.UserSID)"
Write-Host "Home Directory: $($userInfo.HomeDirectory)"
Write-Host "Full Name: $($userInfo.FullName)"
Write-Host "Profile Directory: $($userInfo.ProfileDirectory)"
Write-Host "IP Address: $($userInfo.IPAddress)"
Write-Host "OS Version: $($userInfo.OSVersion)"
Write-Host "Last Boot Time: $($userInfo.LastBootTime)"
Write-Host "Total Physical Memory: $($userInfo.TotalPhysicalMemory) GB"
Write-Host "Information Collected On: $($userInfo.DateCollected)"
Write-Host "===============================" -ForegroundColor Yellow

# Generate a random filename with a 10-character alphanumeric string
$chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
$randomString = -join ((1..10) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
$randomFileName = "UserInfo_$randomString.ps1"

# Create content for the new file
$fileContent = @"
<#
.SYNOPSIS
Saved User Information Script
Generated on: $($userInfo.DateCollected)
#>

# Stored User Information
`$savedUserInfo = @{
    UserName = '$($userInfo.UserName)'
    UserDomain = '$($userInfo.UserDomain)'
    ComputerName = '$($userInfo.ComputerName)'
    UserSID = '$($userInfo.UserSID)'
    HomeDirectory = '$($userInfo.HomeDirectory)'
    FullName = '$($userInfo.FullName -replace "'", "''")'
    ProfileDirectory = '$($userInfo.ProfileDirectory)'
    IPAddress = '$($userInfo.IPAddress)'
    OSVersion = '$($userInfo.OSVersion)'
    LastBootTime = '$($userInfo.LastBootTime)'
    TotalPhysicalMemory = '$($userInfo.TotalPhysicalMemory)'
    DateCollected = '$($userInfo.DateCollected)'
}

Write-Host "=== Saved User Information ===" -ForegroundColor Green
Write-Host "Username: `$savedUserInfo.UserName"
Write-Host "Domain: `$savedUserInfo.UserDomain"
Write-Host "Computer Name: `$savedUserInfo.ComputerName"
Write-Host "User SID: `$savedUserInfo.UserSID"
Write-Host "Home Directory: `$savedUserInfo.HomeDirectory"
Write-Host "Full Name: `$savedUserInfo.FullName"
Write-Host "Profile Directory: `$savedUserInfo.ProfileDirectory"
Write-Host "IP Address: `$savedUserInfo.IPAddress"
Write-Host "OS Version: `$savedUserInfo.OSVersion"
Write-Host "Last Boot Time: `$savedUserInfo.LastBootTime"
Write-Host "Total Physical Memory: `$savedUserInfo.TotalPhysicalMemory GB"
Write-Host "Information Collected On: `$savedUserInfo.DateCollected"
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
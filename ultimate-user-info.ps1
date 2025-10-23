<#
.SYNOPSIS
PowerShell script to get current user information and save to a randomly named .ps1 file.

.DESCRIPTION
This script collects comprehensive user and system information, displays it,
and then creates a new PowerShell script with a random name containing
the same information.

.EXAMPLE
.\ultimate-user-info.ps1
This will collect user information and create a randomly named .ps1 file with the data.

.NOTES
File Name: ultimate-user-info.ps1
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
        OSName = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        LastBootTime = (Get-WmiObject -Class Win32_OperatingSystem).ConvertToDateTime((Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime)
        TotalPhysicalMemory = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
        FreePhysicalMemory = [math]::Round(((Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory * 1KB) / 1GB, 2)
        TotalVirtualMemory = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).TotalVirtualMemorySize * 1KB / 1GB, 2)
        FreeVirtualMemory = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).FreeVirtualMemory * 1KB / 1GB, 2)
        Processor = (Get-WmiObject -Class Win32_Processor).Name
        ProcessorCores = (Get-WmiObject -Class Win32_ComputerSystem).NumberOfLogicalProcessors
        TimeZone = (Get-TimeZone).DisplayName
        Culture = (Get-Culture).Name
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
Write-Host "OS Name: $($userInfo.OSName)"
Write-Host "OS Version: $($userInfo.OSVersion)"
Write-Host "Last Boot Time: $($userInfo.LastBootTime)"
Write-Host "Total Physical Memory: $($userInfo.TotalPhysicalMemory) GB"
Write-Host "Free Physical Memory: $($userInfo.FreePhysicalMemory) GB"
Write-Host "Total Virtual Memory: $($userInfo.TotalVirtualMemory) GB"
Write-Host "Free Virtual Memory: $($userInfo.FreeVirtualMemory) GB"
Write-Host "Processor: $($userInfo.Processor)"
Write-Host "Processor Cores: $($userInfo.ProcessorCores)"
Write-Host "Time Zone: $($userInfo.TimeZone)"
Write-Host "Culture: $($userInfo.Culture)"
Write-Host "Information Collected On: $($userInfo.DateCollected)"
Write-Host "===============================" -ForegroundColor Yellow

# Generate a random filename with a 12-character alphanumeric string
$chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
$randomString = -join ((1..12) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
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
    OSName = '$($userInfo.OSName -replace "'", "''")'
    OSVersion = '$($userInfo.OSVersion)'
    LastBootTime = '$($userInfo.LastBootTime)'
    TotalPhysicalMemory = '$($userInfo.TotalPhysicalMemory)'
    FreePhysicalMemory = '$($userInfo.FreePhysicalMemory)'
    TotalVirtualMemory = '$($userInfo.TotalVirtualMemory)'
    FreeVirtualMemory = '$($userInfo.FreeVirtualMemory)'
    Processor = '$($userInfo.Processor -replace "'", "''")'
    ProcessorCores = '$($userInfo.ProcessorCores)'
    TimeZone = '$($userInfo.TimeZone -replace "'", "''")'
    Culture = '$($userInfo.Culture)'
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
Write-Host "OS Name: `$savedUserInfo.OSName"
Write-Host "OS Version: `$savedUserInfo.OSVersion"
Write-Host "Last Boot Time: `$savedUserInfo.LastBootTime"
Write-Host "Total Physical Memory: `$savedUserInfo.TotalPhysicalMemory GB"
Write-Host "Free Physical Memory: `$savedUserInfo.FreePhysicalMemory GB"
Write-Host "Total Virtual Memory: `$savedUserInfo.TotalVirtualMemory GB"
Write-Host "Free Virtual Memory: `$savedUserInfo.FreeVirtualMemory GB"
Write-Host "Processor: `$savedUserInfo.Processor"
Write-Host "Processor Cores: `$savedUserInfo.ProcessorCores"
Write-Host "Time Zone: `$savedUserInfo.TimeZone"
Write-Host "Culture: `$savedUserInfo.Culture"
Write-Host "Information Collected On: `$savedUserInfo.DateCollected"
Write-Host "===============================" -ForegroundColor Green
"@

# Write the content to the randomly named file
try {
    $fileContent | Out-File -FilePath $randomFileName -Encoding UTF8
    Write-Host "`nUser information has been successfully saved to: $randomFileName" -ForegroundColor Cyan
    Write-Host "File size: $((Get-Item $randomFileName).Length) bytes" -ForegroundColor Cyan
}
catch {
    Write-Error "Error saving file: $_"
    exit 1
}

Write-Host "Script execution completed!" -ForegroundColor Green
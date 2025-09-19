# Get-CurrentUserInfo.ps1
# This script retrieves and displays information about the current user.

# Get the current date and time
$currentDate = Get-Date
Write-Output "Script executed on: $currentDate"

# Get the current username
$username = $env:USER
Write-Output "Current Username: $username"

# Get the current user's home directory
$userHome = $env:HOME
Write-Output "User Home Directory: $userHome"

# Get detailed user ID information using the 'id' command
Write-Output "`nDetailed User Information (from 'id' command):"
$idOutput = id
Write-Output $idOutput

Write-Output "`n--- End of User Information ---"
# PowerShell script to get current user information
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUser.Name
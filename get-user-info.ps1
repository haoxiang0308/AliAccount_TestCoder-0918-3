# PowerShell脚本：获取当前用户信息
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userName = $currentUser.Name
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

Write-Host "当前用户信息："
Write-Host "用户名: $userName"
Write-Host "是否为管理员: $($userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"

# 获取更多用户信息
$envUserInfo = @{
    "用户名" = $env:USERNAME
    "用户域" = $env:USERDOMAIN
    "用户配置文件路径" = $env:USERPROFILE
    "计算机名" = $env:COMPUTERNAME
}

$envUserInfo | Format-List
# 获取当前用户信息的PowerShell脚本
Write-Host "当前用户信息："

# 获取当前用户名
$currentUser = $env:USERNAME
Write-Host "用户名: $currentUser"

# 获取用户域（如果适用）
$userDomain = $env:USERDOMAIN
Write-Host "用户域: $userDomain"

# 获取用户主目录
$userHome = $env:USERPROFILE
Write-Host "用户主目录: $userHome"

# 获取当前用户SID
try {
    $currentUserSID = (Get-WmiObject -Class Win32_UserAccount | Where-Object {$_.Name -eq $currentUser}).SID
    Write-Host "用户SID: $currentUserSID"
}
catch {
    Write-Host "无法获取用户SID"
}

# 获取当前用户的组成员信息
try {
    $groups = (Get-LocalGroupMember -Member $currentUser -ErrorAction SilentlyContinue | Select-Object Name, SID) -join "; "
    Write-Host "所属组: $groups"
}
catch {
    Write-Host "无法获取用户组信息"
}

# 显示当前时间戳
Write-Host "获取时间: $(Get-Date)"
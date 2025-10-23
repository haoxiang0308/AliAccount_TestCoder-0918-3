# 生成随机命名的PowerShell脚本，用于获取当前用户信息

# 生成随机文件名
$randomName = -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {[char]$_})
$fileName = "${randomName}.ps1"

# 定义获取用户信息的脚本内容
$userInfoScript = @'
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
'@

# 将脚本内容写入随机命名的文件
$userInfoScript | Out-File -FilePath $fileName -Encoding UTF8

Write-Host "已创建用户信息脚本: $fileName"
Write-Host "脚本路径: $(Get-Location)\\$fileName"
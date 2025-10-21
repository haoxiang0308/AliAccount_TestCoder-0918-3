# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    "UserName" = $env:USERNAME
    "UserDomain" = $env:USERDOMAIN
    "ComputerName" = $env:COMPUTERNAME
    "UserProfile" = $env:USERPROFILE
    "HomeDirectory" = $env:HOMEDRIVE + $env:HOMEPATH
    "CurrentDate" = Get-Date
}

# 显示当前用户信息
Write-Host "当前用户信息："
$currentUserInfo | Format-List

# 生成随机文件名
$randomFileName = "user_info_" + (Get-Random -Maximum 1000000) + ".ps1"

# 将用户信息保存到随机命名的.ps1文件中
$content = @"
# 当前用户信息 - 生成于 $(Get-Date)
`$userInfo = @{
    "UserName" = "$($currentUserInfo.UserName)"
    "UserDomain" = "$($currentUserInfo.UserDomain)"
    "ComputerName" = "$($currentUserInfo.ComputerName)"
    "UserProfile" = "$($currentUserInfo.UserProfile)"
    "HomeDirectory" = "$($currentUserInfo.HomeDirectory)"
    "CurrentDate" = "$($currentUserInfo.CurrentDate)"
}
"@

# 写入文件
Set-Content -Path $randomFileName -Value $content

Write-Host "用户信息已保存到文件: $randomFileName"
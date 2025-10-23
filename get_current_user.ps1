# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME -and $_.Domain -eq $env:USERDOMAIN}).SID
    HomeDirectory = $env:USERPROFILE
    FullName = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME -and $_.Domain -eq $env:USERDOMAIN}).FullName
}

# 显示当前用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "全名: $($currentUserInfo.FullName)"

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000) + ".ps1"

# 将用户信息保存到随机命名的文件中
$scriptContent = @"
# 保存的用户信息 - 生成时间: $(Get-Date)
`$savedUserInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    FullName = "$($currentUserInfo.FullName)"
}

# 显示保存的用户信息
Write-Host "从文件加载的用户信息："
Write-Host "用户名: `$savedUserInfo.UserName"
Write-Host "用户域: `$savedUserInfo.UserDomain"
Write-Host "计算机名: `$savedUserInfo.ComputerName"
Write-Host "用户SID: `$savedUserInfo.UserSID"
Write-Host "主目录: `$savedUserInfo.HomeDirectory"
Write-Host "全名: `$savedUserInfo.FullName"
"@

# 保存到随机命名的.ps1文件
$scriptContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName"
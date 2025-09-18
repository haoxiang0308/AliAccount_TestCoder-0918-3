# 获取当前用户信息的PowerShell脚本

# 获取当前用户的用户名
$username = $env:USERNAME

# 获取当前用户的域名（如果在域环境中）
$domain = $env:USERDOMAIN

# 获取当前用户的完整名称
$fullName = whoami /full

# 获取当前用户的SID
$userSID = whoami /user

# 获取当前用户的组信息
$userGroups = whoami /groups

# 获取当前用户的权限信息
$userPrivileges = whoami /priv

# 获取当前用户的主目录
$userProfile = $env:USERPROFILE

# 创建一个自定义对象来存储所有信息
$userInfo = [PSCustomObject]@{
    Username = $username
    Domain = $domain
    FullName = $fullName
    SID = $userSID
    UserProfile = $userProfile
}

# 显示用户信息
Write-Host "========== 当前用户信息 ==========" -ForegroundColor Green
$userInfo | Format-List

Write-Host "========== 用户组信息 ==========" -ForegroundColor Green
$userGroups

Write-Host "========== 用户权限信息 ==========" -ForegroundColor Green
$userPrivileges

# 同时将信息保存到文件
$outputFile = "UserInfo_Output.txt"
$userInfo | Out-File -FilePath $outputFile
"userGroups:" | Out-File -FilePath $outputFile -Append
$userGroups | Out-File -FilePath $outputFile -Append
"userPrivileges:" | Out-File -FilePath $outputFile -Append
$userPrivileges | Out-File -FilePath $outputFile -Append

Write-Host "用户信息已保存到 $outputFile" -ForegroundColor Yellow

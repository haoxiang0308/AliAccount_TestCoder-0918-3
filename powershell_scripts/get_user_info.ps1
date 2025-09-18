# 获取当前用户信息的PowerShell脚本

# 获取当前用户的基本信息
$currentUser = Get-User -Identity $env:USERNAME

# 格式化输出
Write-Host "当前用户信息:"
Write-Host "--------------"
Write-Host "用户名: $($currentUser.Name)"
Write-Host "用户主体: $($currentUser.UserPrincipalName)"
Write-Host "电子邮件: $($currentUser.EmailAddress)"
Write-Host "部门: $($currentUser.Department)"
Write-Host "职位: $($currentUser.Title)"
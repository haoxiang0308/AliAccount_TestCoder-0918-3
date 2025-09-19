# 生成一个随机文件名前缀
$randomPrefix = -join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$fileName = "${randomPrefix}_GetUserInfo.ps1"
$filePath = "/workspace/powershell_scripts/$fileName"

# PowerShell脚本内容
$scriptContent = @'
# 获取当前用户信息
$currentUser = whoami
$currentUserObject = Get-LocalUser -Name $currentUser

# 格式化输出
Write-Host "用户名: $($currentUserObject.Name)"
Write-Host "全名: $($currentUserObject.FullName)"
Write-Host "账户状态: $($currentUserObject.Enabled)"
Write-Host "上次登录时间: $($currentUserObject.LastLogon)"
'@

# 将内容写入文件
Set-Content -Path $filePath -Value $scriptContent

Write-Host "PowerShell 脚本已保存到: $filePath"
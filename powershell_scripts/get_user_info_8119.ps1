# 获取当前用户信息并保存到文件
# 文件名: get_user_info_8119.ps1

# 定义输出文件路径
$outputFile = "user_info_8119.txt"

# 获取用户信息
$userInfo = whoami

# 将信息写入文件
$userInfo | Out-File -FilePath $outputFile

# 输出确认信息
Write-Host "用户信息已保存到 $outputFile"
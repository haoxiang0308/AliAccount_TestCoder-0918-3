import os
import random
import string

def generate_random_filename():
    """生成随机文件名"""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"GetUserInfo_{random_string}.ps1"

def generate_powershell_script():
    """生成PowerShell脚本内容"""
    ps_script = """# 获取当前用户信息的PowerShell脚本

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
"""
    return ps_script

def main():
    # 生成随机文件名
    filename = generate_random_filename()
    
    # 生成PowerShell脚本内容
    script_content = generate_powershell_script()
    
    # 保存到文件
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(script_content)
    
    print(f"已创建随机命名的PowerShell脚本: {filename}")

if __name__ == "__main__":
    main()
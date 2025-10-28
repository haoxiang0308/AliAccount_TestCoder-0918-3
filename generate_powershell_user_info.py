import os
import random
import string

def generate_powershell_script():
    # PowerShell脚本内容，用于获取当前用户信息
    ps_script_content = '''# 获取当前用户信息
Write-Host "当前用户信息："
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUserPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

Write-Host "用户名: $($currentUser.Name)"
Write-Host "用户类型: $($currentUser.AuthenticationType)"
Write-Host "是否为管理员: $($currentUserPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"
Write-Host "用户SID: $($currentUser.User.Value)"

# 也可以使用环境变量方式获取
Write-Host ""
Write-Host "通过环境变量获取的信息："
Write-Host "用户名: $env:USERNAME"
Write-Host "用户域: $env:USERDOMAIN"
Write-Host "用户配置文件路径: $env:USERPROFILE"
Write-Host "计算机名: $env:COMPUTERNAME"
'''
    
    # 生成随机文件名
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    filename = f"user_info_{random_name}.ps1"
    
    # 写入PowerShell脚本文件
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(ps_script_content)
    
    print(f"PowerShell脚本已生成: {filename}")
    return filename

if __name__ == "__main__":
    generate_powershell_script()
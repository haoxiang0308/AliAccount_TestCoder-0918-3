import random
import string
import os

def generate_random_filename(ext=".lua"):
    """生成随机文件名"""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}{ext}"

def create_lua_grades_file():
    """创建包含学生成绩表和平均分计算的Lua文件"""
    lua_content = '''-- Lua表存储学生成绩并计算平均分

-- 创建一个包含学生成绩的表
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88,
    ["Frank"] = 91
}

-- 计算平均分
local total = 0
local count = 0

for name, grade in pairs(student_grades) do
    total = total + grade
    count = count + 1
    print("学生: " .. name .. ", 成绩: " .. grade)
end

local average = total / count
print("\\n总分: " .. total)
print("学生人数: " .. count)
print("平均分: " .. string.format("%.2f", average))

-- 返回结果表（可用于其他脚本导入）
return {
    grades = student_grades,
    total = total,
    count = count,
    average = average
}
'''

    # 生成随机文件名
    random_filename = generate_random_filename()
    
    # 写入文件
    with open(f"/workspace/{random_filename}", "w", encoding="utf-8") as f:
        f.write(lua_content)
    
    print(f"已创建随机命名的Lua文件: {random_filename}")
    return random_filename

if __name__ == "__main__":
    filename = create_lua_grades_file()
    
    # 测试生成的文件
    print(f"\n测试生成的文件 {filename}:")
    os.system(f"lua /workspace/{filename}")
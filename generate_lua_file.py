import random
import string
import os

def generate_random_filename(ext='.lua'):
    """生成随机文件名"""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"student_grades_{random_string}{ext}"

def create_lua_student_grades_file():
    # 学生成绩数据
    students = [
        {"name": "张三", "score": 85},
        {"name": "李四", "score": 92},
        {"name": "王五", "score": 78},
        {"name": "赵六", "score": 88},
        {"name": "钱七", "score": 95}
    ]
    
    # 计算平均分
    total_score = sum(student['score'] for student in students)
    average_score = total_score / len(students)
    
    # 生成随机文件名
    filename = generate_random_filename()
    
    # 创建Lua文件内容
    lua_content = f"""-- 学生成绩表
local studentGrades = {{
"""
    
    for student in students:
        lua_content += f'    {{name = "{student["name"]}", score = {student["score"]}}},\n'
    
    lua_content += f"""}} 

-- 计算平均分
local total = 0
for i, student in ipairs(studentGrades) do
    total = total + student.score
end

local average = total / #studentGrades

-- 打印结果
print("学生成绩列表：")
for i, student in ipairs(studentGrades) do
    print(i .. ". " .. student.name .. ": " .. student.score)
end

print("\\n平均分: " .. string.format("%.2f", average))

-- 学生数据和平均分
local result = {{
    students = studentGrades,
    average = {average_score}
}}

return result
"""
    
    # 写入文件
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(lua_content)
    
    print(f"已创建文件: {filename}")
    print("内容:")
    print(lua_content)
    
    return filename

if __name__ == "__main__":
    create_lua_student_grades_file()
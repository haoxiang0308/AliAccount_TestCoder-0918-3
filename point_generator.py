import random
import string

def generate_random_filename(prefix="point_data_", suffix=".txt"):
    """生成随机文件名"""
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{prefix}{random_part}{suffix}"

def create_point_data(x, y):
    """创建坐标点数据"""
    return f"Point({x}, {y})"

def save_point_to_random_file(x, y):
    """将坐标点保存到随机命名的文件中"""
    point_data = create_point_data(x, y)
    filename = generate_random_filename()
    
    with open(filename, 'w') as f:
        f.write(point_data)
    
    print(f"坐标点 {point_data} 已保存到文件: {filename}")
    return filename

# 示例：创建一个坐标点并保存
if __name__ == "__main__":
    # 生成一个随机坐标点
    x = round(random.uniform(-100, 100), 2)
    y = round(random.uniform(-100, 100), 2)
    
    print(f"生成的坐标点: Point({x}, {y})")
    
    # 保存到随机命名的文件
    filename = save_point_to_random_file(x, y)
    
    # 验证文件内容
    with open(filename, 'r') as f:
        content = f.read()
    print(f"从文件 {filename} 读取的内容: {content}")
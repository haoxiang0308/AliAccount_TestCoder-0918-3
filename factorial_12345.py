def factorial(n):
    """计算一个非负整数的阶乘。

    Args:
        n (int): 非负整数

    Returns:
        int: n 的阶乘

    Raises:
        ValueError: 如果 n 是负数
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# 示例用法
if __name__ == "__main__":
    print(f"5! = {factorial(5)}")
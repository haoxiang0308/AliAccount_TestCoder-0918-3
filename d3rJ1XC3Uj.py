def factorial(n):
    """
    计算给定数字的阶乘
    :param n: 非负整数
    :return: n的阶乘
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    elif n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result

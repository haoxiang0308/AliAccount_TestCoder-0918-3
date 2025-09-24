def calc_mean(numbers):
    """
    Вычисляет среднее значение списка или массива чисел.

    Args:
        numbers: Список или массив чисел.

    Returns:
        Среднее значение чисел.
    """
    if not numbers:
        raise ValueError("Список чисел не может быть пустым.")
    return sum(numbers) / len(numbers)

# Пример использования
if __name__ == "__main__":
    sample_data = [10, 20, 30, 40, 50]
    mean_value = calc_mean(sample_data)
    print(f"Среднее значение {sample_data} равно {mean_value}")
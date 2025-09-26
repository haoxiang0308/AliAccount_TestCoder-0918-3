import pickle

# Определяем функцию для вычисления среднего значения
def calculate_mean(numbers):
    """
    Вычисляет среднее значение списка чисел.

    :param numbers: Список чисел
    :return: Среднее значение
    """
    if not numbers:
        return 0  # или можно выбросить исключение
    return sum(numbers) / len(numbers)

# Сохраняем определение функции в файл с помощью pickle
# Это позволяет "сохранить" саму функцию, а не только данные.
with open('calculated_mean_function.pkl', 'wb') as f:
    pickle.dump(calculate_mean, f)

print("Функция 'calculate_mean' определена и сохранена в файл 'calculated_mean_function.pkl'.")
print("Пример вычисления среднего для [1, 2, 3, 4, 5]:", calculate_mean([1, 2, 3, 4, 5]))

import uuid
import os

class Crystal:
    """
    Класс Crystal для управления очередью (FIFO - First In, First Out).
    """

    def __init__(self):
        """
        Инициализирует пустую очередь.
        """
        self._queue = []

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.

        Args:
            item: Элемент для добавления в очередь.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Удаляет и возвращает элемент из начала очереди.

        Returns:
            Элемент, который был первым добавлен в очередь.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди.")
        return self._queue.pop(0)

    def peek(self):
        """
        Возвращает элемент из начала очереди без его удаления.

        Returns:
            Элемент, который находится в начале очереди.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно посмотреть элемент в пустой очереди.")
        return self._queue[0]

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        Returns:
            True, если очередь пуста, иначе False.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Возвращает количество элементов в очереди.

        Returns:
            Целое число, представляющее количество элементов в очереди.
        """
        return len(self._queue)

    def __str__(self):
        """
        Возвращает строковое представление очереди.

        Returns:
            Строка, представляющая текущее состояние очереди.
        """
        return f"Crystal Queue: {self._queue}"


def save_class_to_random_file():
    """
    Сохраняет класс Crystal в файл с случайным именем.
    """
    # Генерируем случайное имя файла
    filename = f"crystal_queue_{uuid.uuid4().hex}.py"
    
    # Получаем путь к текущему файлу (где находится этот скрипт)
    current_file_path = os.path.abspath(__file__)
    current_dir = os.path.dirname(current_file_path)
    
    # Полный путь к новому файлу
    new_file_path = os.path.join(current_dir, filename)
    
    # Читаем содержимое текущего файла
    with open(current_file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Записываем содержимое в новый файл
    with open(new_file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Класс Crystal сохранен в файл: {new_file_path}")
    return new_file_path


# Пример использования класса Crystal
if __name__ == "__main__":
    # Создаем экземпляр очереди
    queue = Crystal()
    
    # Добавляем элементы
    queue.enqueue("Первый")
    queue.enqueue("Второй")
    queue.enqueue("Третий")
    
    print(queue)  # Вывод: Crystal Queue: ['Первый', 'Второй', 'Третий']
    
    # Проверяем размер
    print(f"Размер очереди: {queue.size()}")  # Вывод: Размер очереди: 3
    
    # Смотрим первый элемент
    print(f"Первый элемент: {queue.peek()}")  # Вывод: Первый элемент: Первый
    
    # Извлекаем элементы
    print(f"Извлечен: {queue.dequeue()}")  # Вывод: Извлечен: Первый
    print(f"Извлечен: {queue.dequeue()}")  # Вывод: Извлечен: Второй
    
    print(queue)  # Вывод: Crystal Queue: ['Третий']
    
    # Проверяем, пуста ли очередь
    print(f"Очередь пуста? {queue.is_empty()}")  # Вывод: Очередь пуста? False
    
    # Извлекаем последний элемент
    print(f"Извлечен: {queue.dequeue()}")  # Вывод: Извлечен: Третий
    
    # Проверяем снова
    print(f"Очередь пуста? {queue.is_empty()}")  # Вывод: Очередь пуста? True
    
    # Попытка извлечь из пустой очереди вызовет ошибку
    # print(queue.dequeue())  # Это вызовет IndexError
    
    # Сохраняем класс в файл с случайным именем
    save_class_to_random_file()
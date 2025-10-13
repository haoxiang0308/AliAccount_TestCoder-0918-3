class Crystal:
    """
    Класс Crystal для управления очередью.
    """

    def __init__(self):
        """Инициализирует пустую очередь."""
        self._queue = []

    def enqueue(self, item):
        """Добавляет элемент в конец очереди."""
        self._queue.append(item)

    def dequeue(self):
        """Удаляет и возвращает элемент из начала очереди."""
        if self.is_empty():
            raise IndexError("Crystal: dequeue from empty queue")
        return self._queue.pop(0)

    def front(self):
        """Возвращает элемент из начала очереди без его удаления."""
        if self.is_empty():
            raise IndexError("Crystal: front from empty queue")
        return self._queue[0]

    def is_empty(self):
        """Проверяет, пуста ли очередь."""
        return len(self._queue) == 0

    def size(self):
        """Возвращает количество элементов в очереди."""
        return len(self._queue)


# Пример использования:
# crystal_queue = Crystal()
# crystal_queue.enqueue("первый")
# crystal_queue.enqueue("второй")
# print(crystal_queue.dequeue())  # Выведет "первый"
# print(crystal_queue.size())     # Выведет 1
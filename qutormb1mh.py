import random
import string


class Crystal:
    """
    Класс Crystal для управления очередью (queue).
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
            raise IndexError("dequeue from empty queue")
        return self._queue.pop(0)
    
    def size(self):
        """Возвращает количество элементов в очереди."""
        return len(self._queue)
    
    def is_empty(self):
        """Проверяет, пуста ли очередь."""
        return len(self._queue) == 0
    
    def peek(self):
        """Возвращает первый элемент в очереди без его удаления."""
        if self.is_empty():
            raise IndexError("peek from empty queue")
        return self._queue[0]


# Пример использования:
if __name__ == "__main__":
    # Создаем экземпляр класса Crystal
    crystal_queue = Crystal()
    
    # Добавляем элементы в очередь
    crystal_queue.enqueue(1)
    crystal_queue.enqueue(2)
    crystal_queue.enqueue(3)
    
    print(f"Размер очереди: {crystal_queue.size()}")
    print(f"Первый элемент: {crystal_queue.peek()}")
    
    # Извлекаем элементы из очереди
    while not crystal_queue.is_empty():
        print(f"Извлечен элемент: {crystal_queue.dequeue()}")
    
    print(f"Размер очереди после извлечения: {crystal_queue.size()}")
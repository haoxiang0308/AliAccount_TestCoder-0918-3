import queue
import threading
import time


class Crystal:
    """
    Класс Crystal для управления очередью.
    Использует потокобезопасную очередь для добавления и извлечения элементов.
    """

    def __init__(self):
        """
        Инициализирует внутреннюю очередь.
        """
        self._queue = queue.Queue()
        self._lock = threading.Lock()

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.

        :param item: Элемент для добавления.
        """
        with self._lock:
            self._queue.put(item)
            print(f"Элемент '{item}' добавлен в очередь.")

    def dequeue(self):
        """
        Извлекает и возвращает элемент из начала очереди.
        Если очередь пуста, возвращает None.

        :return: Элемент из очереди или None.
        """
        try:
            with self._lock:
                item = self._queue.get_nowait()
            print(f"Элемент '{item}' извлечен из очереди.")
            return item
        except queue.Empty:
            print("Очередь пуста. Невозможно извлечь элемент.")
            return None

    def size(self):
        """
        Возвращает текущий размер очереди.

        :return: Количество элементов в очереди.
        """
        with self._lock:
            current_size = self._queue.qsize()
        return current_size

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        :return: True, если очередь пуста, иначе False.
        """
        return self.size() == 0


# Пример использования
if __name__ == "__main__":
    crystal_queue = Crystal()

    crystal_queue.enqueue("first")
    crystal_queue.enqueue("second")
    crystal_queue.enqueue("third")

    print(f"Размер очереди: {crystal_queue.size()}")

    while not crystal_queue.is_empty():
        item = crystal_queue.dequeue()
        print(f"Обработан элемент: {item}")

    print(f"Размер очереди после обработки: {crystal_queue.size()}")
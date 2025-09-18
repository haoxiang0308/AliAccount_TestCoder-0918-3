class Crystal:
    """
    Класс Crystal для управления очередью FIFO (First In, First Out).
    """
    
    def __init__(self):
        """Инициализирует пустую очередь."""
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
            Элемент из начала очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди")
        return self._queue.pop(0)
        
    def peek(self):
        """
        Возвращает элемент из начала очереди без его удаления.
        
        Returns:
            Элемент из начала очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно посмотреть элемент в пустой очереди")
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
            Количество элементов в очереди.
        """
        return len(self._queue)
        
    def __str__(self):
        """
        Возвращает строковое представление очереди.
        
        Returns:
            Строковое представление очереди.
        """
        return f"Crystal({self._queue})"
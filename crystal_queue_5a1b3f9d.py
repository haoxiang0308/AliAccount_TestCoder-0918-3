class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = []

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.
        Returns None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue.pop(0)
        return None

    def front(self):
        """
        Returns the item at the front of the queue without removing it.
        Returns None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue[0]
        return None

    def is_empty(self):
        """
        Checks if the queue is empty.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.
        """
        return len(self._queue)

    def clear(self):
        """
        Removes all items from the queue.
        """
        self._queue.clear()


# Example usage:
if __name__ == "__main__":
    q = Crystal()
    q.enqueue("first")
    q.enqueue("second")
    print(f"Size: {q.size()}")  # Size: 2
    print(f"Front item: {q.front()}")  # Front item: first
    item = q.dequeue()
    print(f"Dequeued: {item}")  # Dequeued: first
    print(f"Is empty: {q.is_empty()}")  # Is empty: False
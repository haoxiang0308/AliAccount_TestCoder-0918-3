class Crystal:
    """
    A class for managing a FIFO (First In, First Out) queue.
    """

    def __init__(self):
        """
        Initializes an empty queue.
        """
        from collections import deque
        self._queue = deque()

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to add to the queue.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item at the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self._queue.popleft()

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            int: The number of items in the queue.
        """
        return len(self._queue)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("peek from an empty queue")
        return self._queue[0]

    def __str__(self):
        """
        Returns a string representation of the queue.

        Returns:
            str: A string representation of the queue.
        """
        return f"Crystal Queue({list(self._queue)})"

    def __repr__(self):
        """
        Returns an unambiguous string representation of the queue.

        Returns:
            str: A string that can be used to recreate the object.
        """
        return f"Crystal({list(self._queue)})"

# Example usage:
# q = Crystal()
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# print(q)  # Output: Crystal Queue([1, 2, 3])
# print(q.dequeue())  # Output: 1
# print(q)  # Output: Crystal Queue([2, 3])
# print(q.size())  # Output: 2
# print(q.is_empty())  # Output: False
# print(q.peek())  # Output: 2
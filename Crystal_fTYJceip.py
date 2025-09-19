class Crystal:
    """
    A class to manage a queue data structure.
    """

    def __init__(self):
        """
        Initializes an empty queue.
        """
        self.items = []

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        return len(self.items) == 0

    def enqueue(self, item):
        """
        Adds an item to the rear of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self.items.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self.items.pop(0)

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            int: The number of items in the queue.
        """
        return len(self.items)

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
        return self.items[0]

    def __str__(self):
        """
        Returns a string representation of the queue.

        Returns:
            str: A string representation of the queue.
        """
        return str(self.items)
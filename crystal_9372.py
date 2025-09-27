class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = []

    def add_to_queue(self, item):
        """Adds an item to the end of the queue."""
        self._queue.append(item)

    def remove_from_queue(self):
        """Removes and returns the item from the front of the queue."""
        if not self.is_empty():
            return self._queue.pop(0)
        else:
            raise IndexError("Queue is empty")

    def peek(self):
        """Returns the item at the front of the queue without removing it."""
        if not self.is_empty():
            return self._queue[0]
        else:
            raise IndexError("Queue is empty")

    def is_empty(self):
        """Checks if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Returns the number of items in the queue."""
        return len(self._queue)


# Example usage:
# crystal_queue = Crystal()
# crystal_queue.add_to_queue("First")
# crystal_queue.add_to_queue("Second")
# print(crystal_queue.remove_from_queue())  # Output: "First"
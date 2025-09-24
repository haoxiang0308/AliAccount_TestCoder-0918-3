from collections import deque


class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = deque()

    def enqueue(self, item):
        """Adds an item to the back of the queue."""
        self._queue.append(item)

    def dequeue(self):
        """Removes and returns the item from the front of the queue."""
        if not self.is_empty():
            return self._queue.popleft()
        else:
            raise IndexError("dequeue from an empty queue")

    def is_empty(self):
        """Checks if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Returns the number of items in the queue."""
        return len(self._queue)

    def peek(self):
        """Returns the item at the front of the queue without removing it."""
        if not self.is_empty():
            return self._queue[0]
        else:
            raise IndexError("peek from an empty queue")


# Example usage:
if __name__ == "__main__":
    my_crystal = Crystal()
    my_crystal.enqueue("First")
    my_crystal.enqueue("Second")
    my_crystal.enqueue("Third")

    print(f"Queue size: {my_crystal.size()}")
    print(f"Front item: {my_crystal.peek()}")
    print(f"Dequeued: {my_crystal.dequeue()}")
    print(f"New front item: {my_crystal.peek()}")
    print(f"Is empty: {my_crystal.is_empty()}")
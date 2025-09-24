import queue
import threading
import time

class Crystal:
    """
    Crystal class manages a queue for processing items.
    It uses a thread-safe queue internally and provides methods to add,
    retrieve, and process items, as well as check the queue status.
    """

    def __init__(self):
        """
        Initializes the Crystal instance with an empty queue and a lock for thread safety.
        """
        self._queue = queue.Queue()
        self._lock = threading.Lock()

    def add_item(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added. Can be any object.
        """
        with self._lock:
            self._queue.put(item)
            print(f"Added item: {item}")

    def get_item(self, timeout=None):
        """
        Retrieves and removes the item from the front of the queue.

        Args:
            timeout (float, optional): The maximum time to wait for an item.
                                       If None, it will block indefinitely.

        Returns:
            The item retrieved from the queue.

        Raises:
            queue.Empty: If the queue is empty and no item is available within the timeout.
        """
        try:
            item = self._queue.get(timeout=timeout)
            print(f"Retrieved item: {item}")
            return item
        except queue.Empty:
            print("Queue is empty or timeout reached.")
            raise

    def size(self):
        """
        Returns the current number of items in the queue.

        Returns:
            int: The number of items in the queue.
        """
        with self._lock:
            return self._queue.qsize()

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        with self._lock:
            return self._queue.empty()

    def process_queue(self, processor_func):
        """
        Processes all items currently in the queue using the provided function.

        Args:
            processor_func (callable): A function that takes an item as an argument and processes it.
        """
        while not self._queue.empty():
            try:
                item = self._queue.get_nowait()
                print(f"Processing item: {item}")
                processor_func(item)
            except queue.Empty:
                break


# Example usage:
if __name__ == "__main__":
    crystal = Crystal()

    # Add some items
    crystal.add_item("Diamond")
    crystal.add_item("Ruby")
    crystal.add_item("Emerald")

    print(f"Queue size: {crystal.size()}")
    print(f"Is empty: {crystal.is_empty()}")

    # Process an item
    item = crystal.get_item()
    print(f"Worked with: {item}")

    # Add another and process all
    crystal.add_item("Sapphire")

    def dummy_processor(item):
        time.sleep(0.1)  # Simulate some work
        print(f"  -> Processed {item} in dummy processor")

    crystal.process_queue(dummy_processor)

    print(f"Final size: {crystal.size()}")
    print(f"Is empty: {crystal.is_empty()}")

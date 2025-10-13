import queue
import threading
import time
import json
import os

class Crystal:
    """
    A class to manage a queue with save/load functionality.
    """

    def __init__(self, save_file="crystal_queue.json"):
        """
        Initializes the Crystal queue manager.

        Args:
            save_file (str): The name of the file to save/load the queue. Defaults to 'crystal_queue.json'.
        """
        self._queue = queue.Queue()
        self._save_file = save_file
        self._lock = threading.Lock()
        self.load()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.
        """
        with self._lock:
            self._queue.put(item)
            print(f"Enqueued: {item}")

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.
        Returns None if the queue is empty.
        """
        with self._lock:
            try:
                item = self._queue.get_nowait()
                print(f"Dequeued: {item}")
                return item
            except queue.Empty:
                print("Queue is empty, cannot dequeue.")
                return None

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.
        Returns None if the queue is empty.
        """
        with self._lock:
            try:
                # Get the item, put it back, and return it.
                # This is not perfectly thread-safe against a concurrent dequeue,
                # but serves as a basic peek operation.
                item = self._queue.queue[0] # Access internal list, not get()
                print(f"Peeked: {item}")
                return item
            except IndexError: # queue.queue is an internal list; raises IndexError if empty
                print("Queue is empty, cannot peek.")
                return None

    def size(self):
        """
        Returns the number of items currently in the queue.
        """
        with self._lock:
            size = self._queue.qsize()
            print(f"Queue size: {size}")
            return size

    def is_empty(self):
        """
        Returns True if the queue is empty, False otherwise.
        """
        with self._lock:
            is_empty = self._queue.empty()
            print(f"Is queue empty? {is_empty}")
            return is_empty

    def save(self):
        """
        Saves the current state of the queue to a JSON file.
        """
        with self._lock:
            # Convert queue to a list for JSON serialization
            items = list(self._queue.queue)
            try:
                with open(self._save_file, 'w') as f:
                    json.dump(items, f)
                print(f"Queue saved to {self._save_file}. Items: {items}")
            except IOError as e:
                print(f"Error saving queue to {self._save_file}: {e}")

    def load(self):
        """
        Loads the queue state from a JSON file, if it exists.
        """
        with self._lock:
            if os.path.exists(self._save_file):
                try:
                    with open(self._save_file, 'r') as f:
                        items = json.load(f)
                    # Populate the queue from the loaded list
                    for item in items:
                        self._queue.put(item)
                    print(f"Queue loaded from {self._save_file}. Items: {items}")
                except (IOError, json.JSONDecodeError) as e:
                    print(f"Error loading queue from {self._save_file}: {e}. Starting with an empty queue.")
            else:
                print(f"Save file {self._save_file} not found. Starting with an empty queue.")

    def clear(self):
        """
        Clears all items from the queue.
        """
        with self._lock:
            # Drain the queue by getting all items
            while not self._queue.empty():
                try:
                    self._queue.get_nowait()
                except queue.Empty:
                    break # In case of a race condition
            print("Queue cleared.")


# Example Usage:
if __name__ == "__main__":
    # Create a Crystal queue manager instance
    my_crystal_queue = Crystal("my_queue_data.json")

    # Add items
    my_crystal_queue.enqueue("apple")
    my_crystal_queue.enqueue("banana")
    my_crystal_queue.enqueue("cherry")

    # Check size
    my_crystal_queue.size()

    # Peek at the front item
    my_crystal_queue.peek()

    # Save the queue
    my_crystal_queue.save()

    # Dequeue an item
    my_crystal_queue.dequeue()

    # Check size again
    my_crystal_queue.size()

    # Clear the queue
    my_crystal_queue.clear()

    # Check if empty
    my_crystal_queue.is_empty()

    # Save the now empty queue
    my_crystal_queue.save()

class Crystal
  def initialize
    @queue = [] of Object
  end

  # Add an item to the end of the queue
  def enqueue(item)
    @queue << item
  end

  # Remove and return the first item from the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.shift
    end
  end

  # Return the first item without removing it
  def peek
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.first
    end
  end

  # Check if the queue is empty
  def empty?
    @queue.empty?
  end

  # Return the size of the queue
  def size
    @queue.size
  end

  # Display the current queue
  def display
    puts "Queue: #{@queue.inspect}"
  end
end

# Example usage:
# crystal = Crystal.new
# crystal.enqueue("First")
# crystal.enqueue("Second")
# crystal.enqueue("Third")
# crystal.display
# puts "Dequeued: #{crystal.dequeue}"
# crystal.display
# puts "Peek: #{crystal.peek}"
# puts "Size: #{crystal.size}"
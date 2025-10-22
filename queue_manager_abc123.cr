# Crystal class for managing a queue
class CrystalQueue
  @queue : Array(String | Int32 | Float64 | Bool)

  def initialize
    @queue = [] of String | Int32 | Float64 | Bool
  end

  # Add an item to the end of the queue
  def enqueue(item)
    @queue << item
  end

  # Remove and return the first item from the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.shift
  end

  # Peek at the first item without removing it
  def peek
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.first
  end

  # Check if the queue is empty
  def empty?
    @queue.empty?
  end

  # Get the size of the queue
  def size
    @queue.size
  end

  # Display all items in the queue
  def display
    @queue.each_with_index do |item, index|
      puts "#{index}: #{item}"
    end
  end
end

# Example usage:
# queue = CrystalQueue.new
# queue.enqueue("first")
# queue.enqueue("second")
# queue.enqueue(3)
# queue.display
# puts "Dequeued: #{queue.dequeue}"
# puts "Size: #{queue.size}"
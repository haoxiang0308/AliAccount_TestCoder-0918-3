# Crystal class for managing a queue
class CrystalQueue(T)
  def initialize
    @queue = Array(T).new
  end

  # Add an element to the back of the queue
  def enqueue(element : T)
    @queue.push(element)
  end

  # Remove and return the front element of the queue
  def dequeue : T
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.shift
  end

  # Return the front element without removing it
  def peek : T
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.first
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Display all elements in the queue
  def display
    @queue.each_with_index do |element, index|
      puts "Position #{index}: #{element}"
    end
  end
end

# Example usage:
# queue = CrystalQueue(Int32).new
# queue.enqueue(10)
# queue.enqueue(20)
# puts "Queue size: #{queue.size}"
# queue.display
# puts "Front element: #{queue.peek}"
# puts "Dequeued: #{queue.dequeue}"
# puts "New front element: #{queue.peek}"
# Crystal class for managing a queue
class CrystalQueue
  def initialize
    @queue = [] of Int32 | String | Float64 | Nil # Can store different types
  end

  # Add an element to the back of the queue
  def enqueue(element)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.shift
    end
  end

  # Return the front element without removing it
  def front
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

  # Display all elements in the queue
  def display
    puts @queue.inspect
  end

  # Clear the queue
  def clear
    @queue.clear
  end
end

# Example usage:
# queue = CrystalQueue.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# puts queue.front    # => 1
# puts queue.dequeue  # => 1
# puts queue.size     # => 2
# queue.display       # => [2, 3]
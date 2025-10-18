# A simple queue implementation in Crystal
class CrystalQueue(T)
  def initialize
    @queue = [] of T
  end

  # Add an element to the back of the queue
  def enqueue(element : T)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue : T?
    @queue.shift
  end

  # Return the front element without removing it
  def peek : T?
    @queue.first?
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Clear the queue
  def clear : Nil
    @queue.clear
  end

  # Convert queue to array
  def to_a : Array(T)
    @queue.dup
  end
end

# Example usage
if __FILE__ == $0
  q = CrystalQueue(String).new
  q.enqueue("First")
  q.enqueue("Second")
  q.enqueue("Third")
  
  puts "Queue size: #{q.size}"
  puts "Front element: #{q.peek}"
  
  while !q.empty?
    puts "Dequeued: #{q.dequeue}"
  end
end
class Crystal
  def initialize
    @queue = [] of String
  end

  def enqueue(item : String)
    @queue << item
  end

  def dequeue : String?
    @queue.shift
  end

  def peek : String?
    @queue.first?
  end

  def size : Int32
    @queue.size
  end

  def empty? : Bool
    @queue.empty?
  end

  def clear
    @queue.clear
  end

  def to_a : Array(String)
    @queue.dup
  end
end

# Example usage
queue = Crystal.new
queue.enqueue("first")
queue.enqueue("second")
queue.enqueue("third")

puts "Queue size: #{queue.size}"
puts "First item: #{queue.dequeue}"
puts "Remaining items: #{queue.to_a}"
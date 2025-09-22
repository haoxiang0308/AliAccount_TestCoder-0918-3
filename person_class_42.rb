# Ruby class Person with name and age attributes

class Person
  # attr_accessor creates getter and setter methods for name and age
  attr_accessor :name, :age

  # Initialize method to set initial values for name and age
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Method to display person's information
  def display_info
    puts "Name: #{@name}, Age: #{@age}"
  end
end

# Example usage:
# person = Person.new("Alice", 30)
# person.display_info
# person.age = 31
# person.display_info
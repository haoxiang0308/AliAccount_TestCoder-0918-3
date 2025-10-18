defmodule Greeter do
  @doc """
  Prints a greeting message
  """
  def greet(name) do
    IO.puts "Hello, #{name}! Welcome to Elixir."
  end

  @doc """
  Returns a greeting message as a string
  """
  def greet_string(name) do
    "Hello, #{name}! Welcome to Elixir."
  end
end

# Example usage:
# Greeter.greet("World")
# IO.puts Greeter.greet_string("Alice")
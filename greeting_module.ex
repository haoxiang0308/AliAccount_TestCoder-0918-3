defmodule GreetingModule do
  @doc """
  A simple greeting function that takes a name and returns a greeting message.
  """
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  A default greeting function with a default message.
  """
  def greet do
    "Hello! Welcome to Elixir!"
  end
end
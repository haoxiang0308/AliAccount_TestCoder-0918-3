defmodule GreetingModule do
  @doc """
  Returns a greeting message
  """
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  Returns a generic greeting
  """
  def greet do
    "Hello! Welcome to Elixir!"
  end
end
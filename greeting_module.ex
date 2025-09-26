defmodule GreetingModule do
  @doc """
  Возвращает приветствие для указанного имени.
  """
  def greet(name) do
    "Hello, #{name}!"
  end
end
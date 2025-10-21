defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse_list(list) do
    Enum.reverse(list)
  end
  
  # Alternative implementation using recursion
  def reverse_list_recursive([]), do: []
  def reverse_list_recursive([head | tail]) do
    reverse_list_recursive(tail) ++ [head]
  end
end
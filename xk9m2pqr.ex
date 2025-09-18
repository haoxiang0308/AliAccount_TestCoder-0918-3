defmodule ListReverser do
  @doc """
  Reverses a list.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse([:a, :b, :c, :d])
      [:d, :c, :b, :a]
  """
  def reverse(list) do
    Enum.reverse(list)
  end
  
  @doc """
  Reverses a list using recursion instead of Enum.reverse/1.
  
  ## Examples
  
      iex> ListReverser.reverse_recursive([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse_recursive([])
      []
  """
  def reverse_recursive(list) do
    reverse_recursive(list, [])
  end
  
  defp reverse_recursive([], acc), do: acc
  defp reverse_recursive([head | tail], acc) do
    reverse_recursive(tail, [head | acc])
  end
end
defmodule ListReverser do
  @doc """
  Reverses a list using recursion.
  """
  def reverse_list([]), do: []

  def reverse_list([head | tail]) do
    reverse_list(tail) ++ [head]
  end

  # Alternative implementation using an accumulator for better performance
  def reverse_list_acc(list), do: reverse_list_acc(list, [])

  defp reverse_list_acc([], acc), do: acc
  defp reverse_list_acc([head | tail], acc), do: reverse_list_acc(tail, [head | acc])
end

# Example usage
list = [1, 2, 3, 4, 5]
IO.puts("Original list: #{inspect(list)}")
IO.puts("Reversed list: #{inspect(ListReverser.reverse_list(list))}")
IO.puts("Reversed list (acc): #{inspect(ListReverser.reverse_list_acc(list))}")
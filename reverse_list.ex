defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse_list(list) do
    Enum.reverse(list)
  end
end

# Example usage:
# IO.inspect ListReverser.reverse_list([1, 2, 3, 4, 5])
# IO.inspect ListReverser.reverse_list(["a", "b", "c"])
defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse_list(list) do
    Enum.reverse(list)
  end
end

# Example usage:
IO.inspect ListReverser.reverse_list([1, 2, 3, 4])
# Output: [4, 3, 2, 1]
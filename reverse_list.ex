defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
end
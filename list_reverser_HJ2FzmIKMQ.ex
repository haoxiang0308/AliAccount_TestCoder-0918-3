defmodule ListReverser do
  @moduledoc """
  A module containing functions to reverse lists in Elixir.
  """

  @doc """
  Reverses a list using recursion.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3, 4])
      [4, 3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse([:a, :b, :c])
      [:c, :b, :a]
  """
  def reverse(list) do
    reverse_helper(list, [])
  end
  
  # Helper function that accumulates the reversed list
  defp reverse_helper([], acc), do: acc
  defp reverse_helper([head | tail], acc) do
    reverse_helper(tail, [head | acc])
  end
  
  @doc """
  Reverses a list using Elixir's built-in Enum.reverse/1 function.
  
  ## Examples
  
      iex> ListReverser.reverse_builtin([1, 2, 3, 4])
      [4, 3, 2, 1]
  """
  def reverse_builtin(list) do
    Enum.reverse(list)
  end
end
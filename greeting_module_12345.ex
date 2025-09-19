defmodule Greeting do
  @moduledoc """
  A simple module that provides a greeting function.
  """

  @doc """
  Returns a greeting for the given name.

  ## Examples

      iex> Greeting.hello("World")
      "Hello, World!"

  """
  def hello(name) do
    "Hello, #{name}!"
  end
end
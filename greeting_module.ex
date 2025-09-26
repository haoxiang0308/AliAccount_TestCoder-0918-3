defmodule GreetingModule do
  @doc "Приветствует пользователя по имени."
  def greet(name) do
    "Привет, #{name}!"
  end
end
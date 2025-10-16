defmodule Greeting do
  @doc \"\"\"
  Функция приветствия. Принимает имя и возвращает приветственное сообщение.
  \"\"\"
  def hello(name) do
    \"Привет, #{name}!\"
  end
end
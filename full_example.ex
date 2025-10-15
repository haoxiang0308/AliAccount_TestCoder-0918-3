defmodule CompileTimeLogger do
  @moduledoc """
  定义一个宏用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro log_and_save(message) do
    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16(case: :lower)
    filename = Path.join(File.cwd!(), "#{random_name}.ex")
    
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_string()
    
    # 准备要保存的内容
    content = """
    # Generated at: #{timestamp}
    # Message: #{inspect(message)}
    
    # Compile-time log entry
    """
    
    # 保存到文件
    File.write!(filename, content)
    
    # 在编译时打印信息
    IO.puts("Compile-time log: #{inspect(message)}")
    IO.puts("Saved to: #{filename}")
    
    # 返回nil，因为宏只用于副作用
    quote do
      nil
    end
  end
end

defmodule Example do
  require CompileTimeLogger

  # 使用宏记录编译时信息
  CompileTimeLogger.log_and_save("This is a compile-time message")
  CompileTimeLogger.log_and_save("Another compile-time log entry")

  def hello do
    "Hello from Example module"
  end
end

# 调用函数以触发编译
IO.puts(Example.hello)
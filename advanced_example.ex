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
  
  # 扩展版本，允许自定义内容
  defmacro log_and_save_advanced(message, opts \\ []) do
    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16(case: :lower)
    filename = Path.join(File.cwd!(), "#{random_name}.ex")
    
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_string()
    
    # 获取调用位置信息
    line = __CALLER__.line
    file = __CALLER__.file
    
    # 准备要保存的内容
    content = """
    # Generated at: #{timestamp}
    # File: #{file}:#{line}
    # Message: #{inspect(message)}
    # Options: #{inspect(opts)}
    
    # Advanced compile-time log entry
    """
    
    # 保存到文件
    File.write!(filename, content)
    
    # 在编译时打印信息
    IO.puts("Advanced compile-time log: #{inspect(message)}")
    IO.puts("File: #{file}:#{line}")
    IO.puts("Options: #{inspect(opts)}")
    IO.puts("Saved to: #{filename}")
    
    # 返回nil，因为宏只用于副作用
    quote do
      nil
    end
  end
end

defmodule TestModule do
  require CompileTimeLogger

  # 使用基本宏
  CompileTimeLogger.log_and_save("Basic compile-time message")
  
  # 使用高级宏
  CompileTimeLogger.log_and_save_advanced("Advanced compile-time message", 
                                          [author: "Developer", type: "debug"])
  
  # 再次使用基本宏
  CompileTimeLogger.log_and_save("Another basic message")

  def test do
    "Test function executed"
  end
end

# 调用函数以触发编译
IO.puts("Module compiled successfully!")
IO.puts(TestModule.test)
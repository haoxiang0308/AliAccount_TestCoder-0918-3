defmodule CompileTimeLogger do
  @moduledoc """
  模块用于定义宏，在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro log_and_save(message) do
    # 生成随机文件名
    random_filename = generate_random_filename()
    
    # 获取编译时上下文信息
    context_info = %{
      file: __CALLER__.file,
      line: __CALLER__.line,
      module: __CALLER__.module
    }
    
    # 准备要保存的信息
    info_to_save = %{
      message: message,
      context: context_info,
      timestamp: DateTime.utc_now()
    }
    
    # 将信息保存到文件
    save_to_file(random_filename, info_to_save)
    
    # 在编译时打印信息
    IO.puts("Compile-time log: #{message}")
    IO.puts("Saved to file: #{random_filename}")
    
    # 返回一个简单的表达式（宏必须返回有效的Elixir AST）
    quote do
      unquote(message)
    end
  end

  defp generate_random_filename do
    # 生成随机字符串作为文件名
    random_string = 
      12 
      |> :crypto.strong_rand_bytes()
      |> Base.encode16()
      |> String.slice(0, 12)
      |> String.downcase()
    
    "compile_log_#{random_string}.ex"
  end

  defp save_to_file(filename, data) do
    # 将数据转换为可读格式并保存到文件
    content = """
    # Compile-time log file
    # Generated at: #{data.timestamp}
    
    %{
      message: #{inspect(data.message)},
      context: %{
        file: #{inspect(data.context.file)},
        line: #{inspect(data.context.line)},
        module: #{inspect(data.context.module)}
      },
      timestamp: #{inspect(data.timestamp)}
    }
    """
    
    File.write!(filename, content)
    IO.puts("Saved compile-time info to #{filename}")
  end
end

# 使用示例
defmodule TestModule do
  require CompileTimeLogger
  
  # 使用宏记录编译时信息
  CompileTimeLogger.log_and_save("This is a compile-time message")
  
  def test_function do
    "This is a test function"
  end
end
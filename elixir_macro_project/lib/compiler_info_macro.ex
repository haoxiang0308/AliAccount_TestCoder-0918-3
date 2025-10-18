defmodule CompilerInfoMacro do
  @moduledoc """
  定义一个Elixir宏来打印编译时信息并将其保存到随机命名的.ex文件中
  """

  defmacro print_compile_time_info(message \\ "") do
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"
    
    # 获取编译时信息
    compile_info = %{
      message: message,
      timestamp: timestamp,
      file: __CALLER__.file,
      line: __CALLER__.line,
      module: __CALLER__.module,
      function: __CALLER__.function
    }
    
    # 打印编译时信息
    IO.puts("=== 编译时信息 ===")
    IO.puts("消息: #{message}")
    IO.puts("时间戳: #{timestamp}")
    IO.puts("文件: #{__CALLER__.file}")
    IO.puts("行号: #{__CALLER__.line}")
    IO.puts("模块: #{inspect(__CALLER__.module)}")
    if __CALLER__.function do
      IO.puts("函数: #{inspect(__CALLER__.function)}")
    else
      IO.puts("函数: 无")
    end
    IO.puts("==================")
    
    # 保存信息到随机命名的文件
    file_content = """
    # 编译时信息记录
    # 生成时间: #{timestamp}
    # 源文件: #{__CALLER__.file}:#{__CALLER__.line}
    # 模块: #{inspect(__CALLER__.module)}
    # 函数: #{inspect(__CALLER__.function)}
    # 消息: #{message}
    
    defmodule CompileInfo do
      def get_info do
        unquote(Macro.escape(compile_info))
      end
    end
    """
    
    File.write(filename, file_content)
    IO.puts("编译时信息已保存到文件: #{filename}")
    
    # 返回一个简单的表达式，这样宏可以被正常使用
    quote do
      unquote(message)
    end
  end
  
  @doc """
  一个更高级的宏，可以记录更详细的编译时环境信息
  """
  defmacro log_compile_environment(message \\ "") do
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_env_#{random_suffix}.ex"
    
    # 收集编译环境信息
    env_info = %{
      message: message,
      timestamp: timestamp,
      file: __CALLER__.file,
      line: __CALLER__.line,
      module: __CALLER__.module,
      function: __CALLER__.function,
      elixir_version: System.version(),
      otp_version: System.otp_release(),
      node_name: Node.self()
    }
    
    # 打印编译环境信息
    IO.puts("=== 编译环境信息 ===")
    IO.puts("消息: #{message}")
    IO.puts("时间戳: #{timestamp}")
    IO.puts("文件: #{__CALLER__.file}")
    IO.puts("行号: #{__CALLER__.line}")
    IO.puts("模块: #{inspect(__CALLER__.module)}")
    if __CALLER__.function do
      IO.puts("函数: #{inspect(__CALLER__.function)}")
    else
      IO.puts("函数: 无")
    end
    IO.puts("Elixir版本: #{System.version()}")
    IO.puts("OTP版本: #{System.otp_release()}")
    IO.puts("节点名称: #{Node.self()}")
    IO.puts("==================")
    
    # 保存详细信息到随机命名的文件
    file_content = """
    # 编译环境信息记录
    # 生成时间: #{timestamp}
    # 源文件: #{__CALLER__.file}:#{__CALLER__.line}
    # 模块: #{inspect(__CALLER__.module)}
    # 函数: #{inspect(__CALLER__.function)}
    # 消息: #{message}
    
    defmodule CompileEnvironmentInfo do
      def get_info do
        unquote(Macro.escape(env_info))
      end
      
      def print_info do
        info_data = get_info()
        IO.puts("=== 编译环境信息 ===")
        IO.puts("消息: \#{info_data[:message]}")
        IO.puts("时间戳: \#{info_data[:timestamp]}")
        IO.puts("文件: \#{info_data[:file]}")
        IO.puts("行号: \#{info_data[:line]}")
        IO.puts("模块: \#{inspect(info_data[:module])}")
        IO.puts("函数: \#{inspect(info_data[:function])}")
        IO.puts("Elixir版本: \#{info_data[:elixir_version]}")
        IO.puts("OTP版本: \#{info_data[:otp_version]}")
        IO.puts("节点名称: \#{info_data[:node_name]}")
        IO.puts("==================")
      end
    end
    """
    
    File.write(filename, file_content)
    IO.puts("编译环境信息已保存到文件: #{filename}")
    
    # 返回一个简单的表达式
    quote do
      unquote(message)
    end
  end
end
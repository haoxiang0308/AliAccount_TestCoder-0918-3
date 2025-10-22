defmodule CompileInfoMacro do
  @moduledoc """
  宏模块，用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(info) do
    # 获取当前时间戳作为随机部分
    timestamp = System.system_time(:second)
    # 生成随机数
    random_num = :rand.uniform(10000)
    # 创建随机文件名
    filename = "compile_info_#{timestamp}_#{random_num}.ex"

    # 获取当前模块和函数信息
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line

    # 创建要保存的信息
    compile_info = %{
      module: module,
      file: file,
      line: line,
      info: info,
      timestamp: DateTime.utc_now(),
      node: Node.self()
    }

    # 打印编译时信息
    IO.puts("Compile-time info:")
    IO.inspect(compile_info)

    # 将信息保存到随机命名的文件
    compile_info_inspected = inspect(compile_info)
    file_content = """
    # Compile-time information generated at #{DateTime.to_string(compile_info.timestamp)}
    # From module: #{inspect(compile_info.module)}
    # File: #{compile_info.file}
    # Line: #{compile_info.line}

    defmodule CompileInfo do
      def get_info do
        #{compile_info_inspected}
      end
    end
    """

    File.write(filename, file_content)
    IO.puts("Compile-time info saved to: #{filename}")

    # 返回原始信息，这样宏不会改变代码的行为
    quote do
      unquote(info)
    end
  end

  # 另一个宏，提供更多编译时上下文
  defmacro log_compile_context do
    timestamp = System.system_time(:second)
    random_num = :rand.uniform(10000)
    filename = "compile_context_#{timestamp}_#{random_num}.ex"

    context_info = %{
      module: __CALLER__.module,
      file: __CALLER__.file,
      function: __CALLER__.function,
      line: __CALLER__.line,
      aliases: __CALLER__.aliases,
      functions: __CALLER__.functions,
      macros: __CALLER__.macros,
      timestamp: DateTime.utc_now(),
      node: Node.self(),
      otp_release: System.otp_release(),
      elixir_version: System.version()
    }

    IO.puts("Compile-time context:")
    IO.inspect(context_info)

    context_info_inspected = inspect(context_info)
    file_content = """
    # Compile-time context generated at #{DateTime.to_string(context_info.timestamp)}
    # Module: #{inspect(context_info.module)}
    # File: #{context_info.file}
    # Function: #{inspect(context_info.function)}
    # Line: #{context_info.line}

    defmodule CompileContext do
      def get_context do
        #{context_info_inspected}
      end
    end
    """

    File.write(filename, file_content)
    IO.puts("Compile-time context saved to: #{filename}")

    # 返回nil，因为这个宏只是用来记录信息
    nil
  end
end
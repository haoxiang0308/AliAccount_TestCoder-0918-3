defmodule CompileInfo do
  @moduledoc """
  A module that provides a macro to print and save compile-time information.
  """

  defmacro print_compile_info do
    # 获取编译时信息
    file = __CALLER__.file
    module = __CALLER__.module
    function = __CALLER__.function
    line = __CALLER__.line

    # 创建编译时信息字符串
    compile_info = %{
      file: file,
      module: module,
      function: function,
      line: line,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      node: Node.self()
    }

    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(16) |> Base.encode16(case: :lower)
    file_name = "compile_info_#{random_name}.ex"

    # 打印编译时信息到控制台
    IO.puts("Compile-time information:")
    IO.puts("File: #{inspect(compile_info.file)}")
    IO.puts("Module: #{inspect(compile_info.module)}")
    IO.puts("Function: #{inspect(compile_info.function)}")
    IO.puts("Line: #{inspect(compile_info.line)}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Node: #{inspect(compile_info.node)}")

    # 将信息保存到随机命名的.ex文件
    file_content = """
    # Compile-time information saved at #{compile_info.timestamp}
    %{
      file: #{inspect(compile_info.file)},
      module: #{inspect(compile_info.module)},
      function: #{inspect(compile_info.function)},
      line: #{inspect(compile_info.line)},
      timestamp: "#{compile_info.timestamp}",
      node: #{inspect(compile_info.node)}
    }
    """

    File.write(file_name, file_content)
    IO.puts("Compile-time information saved to #{file_name}")

    # 返回宏的值（这里简单返回:ok）
    quote do
      :ok
    end
  end
end

# 使用示例
defmodule ExampleModule do
  require CompileInfo

  def example_function do
    CompileInfo.print_compile_info()
    "Example function executed"
  end
end
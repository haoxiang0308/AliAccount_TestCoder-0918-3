defmodule CompilerInfo do
  defmacro print_compile_time_info do
    # 获取当前时间戳
    timestamp = DateTime.utc_now()
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"
    
    # 编译时信息
    compile_info = %{
      file: __CALLER__.file,
      module: __CALLER__.module,
      function: __CALLER__.function,
      timestamp: timestamp,
      node: Node.self()
    }
    
    # 将信息保存到随机命名的文件中
    File.write!(filename, inspect(compile_info, pretty: true))
    
    # 在编译时打印信息
    IO.puts("Compile-time info saved to #{filename}")
    IO.inspect(compile_info)
    
    # 返回一个简单的值，这样宏可以在代码中使用
    quote do
      unquote(Macro.to_string(compile_info))
    end
  end
end

# 使用示例
defmodule TestModule do
  require CompilerInfo
  
  # 使用宏
  CompilerInfo.print_compile_time_info()
  
  def test_function do
    "This is a test function"
  end
end
defmodule CompileInfo do
  defmacro print_and_save_compile_info do
    # 获取编译时信息
    compile_info = %{
      file: __CALLER__.file,
      module: __CALLER__.module,
      function: __CALLER__.function,
      line: __CALLER__.line,
      node: Node.self(),
      node_info: Node.info(),
      system_info: %{
        otp_release: System.otp_release(),
        version: System.version(),
        build_info: System.build_info()
      }
    }

    # 生成随机文件名
    random_filename = "compile_info_#{:rand.uniform(1000000)}.ex"
    
    # 将信息格式化为字符串
    info_string = 
      "Compile Time Info:\n" <>
      "File: #{inspect(compile_info.file)}\n" <>
      "Module: #{inspect(compile_info.module)}\n" <>
      "Function: #{inspect(compile_info.function)}\n" <>
      "Line: #{inspect(compile_info.line)}\n" <>
      "Node: #{inspect(compile_info.node)}\n" <>
      "OTP Release: #{inspect(compile_info.system_info.otp_release)}\n" <>
      "Elixir Version: #{inspect(compile_info.system_info.version)}\n" <>
      "Build Info: #{inspect(compile_info.system_info.build_info)}\n"
    
    # 打印到控制台
    IO.puts(info_string)
    
    # 保存到文件
    File.write!(random_filename, info_string)
    IO.puts("Compile info saved to #{random_filename}")
    
    # 在编译时也返回信息
    quote do
      unquote(Macro.escape(compile_info))
    end
  end
end
# 引入宏模块
Code.require_file("compile_info_macro.ex")

# 定义一个示例模块，使用宏来打印编译时信息
defmodule ExampleModule do
  require CompileInfoMacro

  # 使用宏打印编译时信息
  CompileInfoMacro.print_compile_info("这是一个示例模块")

  def example_function do
    # 在函数内部使用宏
    CompileInfoMacro.print_compile_info("这是在函数内部的编译信息")
    :ok
  end

  def another_function do
    # 再次使用宏
    info = CompileInfoMacro.print_compile_info("这是另一个函数中的编译信息")
    IO.inspect(info, label: "返回的编译信息")
    :done
  end
end

# 调用函数以查看运行时行为
ExampleModule.example_function()
ExampleModule.another_function()

# 列出当前目录中的随机命名文件
IO.puts("\n当前目录中的随机命名编译信息文件:")
for file <- File.ls!(".") do
  if String.match?(file, ~r/^compile_info_.*\.ex$/) do
    IO.puts("- #{file}")
  end
end
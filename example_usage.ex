# 引入宏模块
defmodule Example do
  require CompileInfoMacro

  # 使用宏打印和保存编译时信息
  CompileInfoMacro.print_and_save_compile_info("Hello from compile time!")

  # 使用宏记录编译上下文
  CompileInfoMacro.log_compile_context()

  def hello do
    # 在函数内部使用宏
    CompileInfoMacro.print_and_save_compile_info("Inside hello function")
    "Hello, World!"
  end

  def test do
    # 另一次使用宏
    CompileInfoMacro.log_compile_context()
    :ok
  end
end
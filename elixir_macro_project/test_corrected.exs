# 引入宏模块
Code.require_file("compile_info_macro.ex")

# 定义一个示例模块，使用宏来打印编译时信息
defmodule TestCorrectedModule do
  require CompileInfoMacro

  # 使用宏打印编译时信息
  CompileInfoMacro.print_compile_info("这是修正后的测试")

  def test_function do
    # 在函数内部使用宏
    CompileInfoMacro.print_compile_info("这是在函数内部的修正后测试")
    :ok
  end
end

IO.puts("修正后的宏测试完成")
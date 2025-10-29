# 加载宏定义
Code.require_file("compile_info_macro.ex")

# 使用宏
defmodule TestModule do
  require CompileInfo

  def test_function do
    IO.puts("Calling macro...")
    CompileInfo.print_compile_info()
    IO.puts("Macro called successfully!")
  end
end

# 调用函数以触发宏
TestModule.test_function()
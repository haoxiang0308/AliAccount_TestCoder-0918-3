# 引入宏定义
defmodule Example do
  require CompileInfo

  # 使用宏
  CompileInfo.print_and_save_compile_info()

  def test_function do
    # 在函数内部再次使用宏来获取函数特定信息
    CompileInfo.print_and_save_compile_info()
    IO.puts("This is a test function")
  end
end
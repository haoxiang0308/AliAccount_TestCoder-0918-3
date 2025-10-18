defmodule Example do
  require CompilerInfoMacro
  
  # 使用宏打印编译时信息并保存到随机命名的.ex文件
  CompilerInfoMacro.print_compile_time_info("这是第一个示例")
  
  def hello do
    # 使用宏记录函数内的编译环境信息
    CompilerInfoMacro.log_compile_environment("在hello函数中")
    "Hello, World!"
  end
  
  def test_function do
    # 另一个使用宏的例子
    CompilerInfoMacro.print_compile_time_info("测试函数编译信息")
    :ok
  end
end
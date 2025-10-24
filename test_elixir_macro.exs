#!/usr/bin/env elixir
# 由于当前环境可能没有Elixir，这个文件提供了如何测试宏的说明

# 如果你有Elixir环境，可以这样测试：
#
# 1. 保存以下内容到文件 test_macro.exs
# 2. 运行命令: elixir test_macro.exs

# 加载宏定义
Code.require_file("compile_info_macro.ex")

# 测试宏
IO.puts("Testing CompileInfoMacro...")

# 当这个模块被编译时，宏会输出编译时信息并生成随机命名的.ex文件
defmodule TestCompileInfo do
  import CompileInfoMacro
  
  def run do
    print_compile_info("Testing the compile info macro")
    IO.puts("Function executed successfully")
  end
end

# 调用函数
TestCompileInfo.run()

IO.puts("Check the /workspace/ directory for randomly named .ex files containing compile-time info.")
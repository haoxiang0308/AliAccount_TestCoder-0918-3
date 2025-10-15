defmodule Example do
  require CompileTimeLogger

  # 使用宏记录编译时信息
  CompileTimeLogger.log_and_save("This is a compile-time message")
  CompileTimeLogger.log_and_save("Another compile-time log entry")

  def hello do
    "Hello from Example module"
  end
end

# 编译模块以触发宏
Example.hello
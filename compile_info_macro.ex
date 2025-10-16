defmodule CompileInfoMacro do
  @moduledoc """
  定义一个Elixir宏来打印编译时信息并保存到随机命名的.ex文件中
  """

  defmacro print_compile_info() do
    # 获取当前时间戳
    timestamp = System.system_time(:second)
    # 生成随机数
    random_num = :rand.uniform(1000000)
    # 创建随机文件名
    filename = "compile_info_#{timestamp}_#{random_num}.ex"
    
    # 获取当前模块和函数信息
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    
    # 创建要写入的信息
    info = """
    # 编译时信息
    # 文件: #{file}
    # 模块: #{module}
    # 行号: #{line}
    # 时间戳: #{timestamp}
    # 随机数: #{random_num}
    # 编译时间: #{DateTime.utc_now()}
    """
    
    # 打印信息到控制台
    IO.puts("编译时信息:")
    IO.puts(info)
    
    # 将信息写入随机命名的文件
    File.write(filename, info)
    IO.puts("已将编译时信息保存到文件: #{filename}")
    
    # 返回一个简单的值，因为宏必须返回有效的Elixir表达式
    quote do
      {:ok, unquote(filename)}
    end
  end
end

# 使用宏的示例
defmodule TestModule do
  require CompileInfoMacro
  
  def test_function do
    CompileInfoMacro.print_compile_info()
    :ok
  end
end

# 调用宏
TestModule.test_function()
# Elixir 编译时信息宏

这个项目包含两个Elixir宏，用于在编译时捕获和保存信息到随机命名的.ex文件中。

## 宏定义

### `print_and_save_compile_info(info)`

这个宏接受一个参数，并在编译时：

1. 打印编译时信息到控制台
2. 将信息保存到随机命名的.ex文件中
3. 返回原始信息，不影响代码行为

### `log_compile_context()`

这个宏记录更详细的编译上下文信息：

1. 打印详细的编译上下文到控制台
2. 将上下文信息保存到随机命名的.ex文件中
3. 返回nil

## 使用方法

在您的Elixir代码中使用这些宏：

```elixir
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
```

## 输出

每次使用宏时，都会在编译时生成一个随机命名的.ex文件，文件名格式为：

- `compile_info_{timestamp}_{random_number}.ex`
- `compile_context_{timestamp}_{random_number}.ex`

这些文件包含完整的编译时信息，可以作为独立的Elixir模块使用。
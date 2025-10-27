# Elixir 编译时信息宏

这个项目定义了一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能

- 在编译时捕获并打印信息
- 保存编译时信息到随机命名的.ex文件
- 包含以下信息：
  - 消息内容
  - 源文件路径
  - 源代码行号
  - 源模块名
  - 源函数名
  - 时间戳

## 宏定义

`CompileInfoMacro.print_and_save_compile_info/1` 宏在编译时执行以下操作：

1. 获取当前时间戳
2. 生成随机文件名
3. 捕获调用者信息（文件、行号、模块、函数）
4. 打印编译时信息到控制台
5. 将编译时信息保存到随机命名的.ex文件中

## 使用示例

```elixir
defmodule Example do
  require CompileInfoMacro

  def example_function do
    CompileInfoMacro.print_and_save_compile_info("这是一个示例消息")
    :ok
  end
end
```

每次调用宏时，都会生成一个包含编译时信息的随机命名.ex文件，例如：

```elixir
# 编译时信息
# 生成时间: 2025-10-27T19:47:43.512745Z
# 源文件: "/workspace/test_macro.exs"
# 源行号: 6
# 源模块: TestModule
# 源函数: {:test_function, 0}

defmodule CompileInfo do
  def get_info do
    %{
      file: "/workspace/test_macro.exs",
      function: {:test_function, 0},
      line: 6,
      message: "这是测试消息",
      module: TestModule,
      timestamp: "2025-10-27T19:47:43.512745Z"
    }
  end
end
```

## 文件结构

- `compile_info_macro.ex` - 包含宏定义的主文件
- `compile_info_*.ex` - 随机命名的编译时信息文件
- `test_macro.exs` - 测试示例文件
# Elixir 编译时信息宏

这个项目定义了一个Elixir宏，用于在编译时收集和保存信息到随机命名的.ex文件中。

## 功能

- 收集编译时信息（文件名、行号、模块、函数、时间戳等）
- 打印编译时信息到控制台
- 将编译时信息保存到随机命名的.ex文件中
- 生成的文件包含一个可调用的模块来获取编译时信息

## 用法

```elixir
defmodule ExampleModule do
  require CompileInfoMacro

  # 在模块级别使用宏
  CompileInfoMacro.print_compile_info("这是模块级别的信息")

  def example_function do
    # 在函数内部使用宏
    CompileInfoMacro.print_compile_info("这是函数内部的信息")
    :ok
  end
end
```

## 宏功能说明

`CompileInfoMacro.print_compile_info/1` 宏会：

1. 收集编译时信息：
   - 文件名
   - 行号
   - 模块名
   - 函数名（如果在函数内部）
   - 时间戳
   - 用户提供的描述

2. 将信息打印到控制台

3. 生成一个随机命名的.ex文件（格式：compile_info_XXXXXXXXXXXXXXXX.ex），其中包含：
   - 信息的注释头
   - 一个可调用的 `CompileInfo` 模块
   - `get_info/0` 函数，返回编译时信息的映射

## 示例

运行 `example.exs` 文件可以看到宏的实际效果：

```bash
elixir example.exs
```

这将生成类似 `compile_info_a1b2c3d4e5f67890.ex` 的文件，其中包含编译时收集的所有信息。
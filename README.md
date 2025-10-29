# Elixir Compile-Time Information Macro

## 概述

本项目包含一个Elixir宏，用于在编译时收集和保存信息到随机命名的.ex文件中。

## 文件说明

1. `compile_info_macro.ex` - 包含宏定义的Elixir模块
2. `test_macro.exs` - 测试宏的示例脚本

## 宏功能说明

`CompileInfo.print_compile_info/0` 宏的功能包括：

1. 收集编译时信息：
   - 文件路径
   - 当前模块
   - 当前函数
   - 当前行号
   - 时间戳
   - 节点信息

2. 在控制台打印编译时信息

3. 将信息保存到随机命名的.ex文件中（格式为 `compile_info_[随机字符串].ex`）

## 使用方法

1. 首先需要定义宏（已在 `compile_info_macro.ex` 中完成）：

```elixir
defmodule CompileInfo do
  defmacro print_compile_info do
    # 获取编译时信息
    file = __CALLER__.file
    module = __CALLER__.module
    function = __CALLER__.function
    line = __CALLER__.line

    # 创建编译时信息字符串
    compile_info = %{
      file: file,
      module: module,
      function: function,
      line: line,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      node: Node.self()
    }

    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(16) |> Base.encode16(case: :lower)
    file_name = "compile_info_#{random_name}.ex"

    # 打印编译时信息到控制台
    IO.puts("Compile-time information:")
    IO.puts("File: #{inspect(compile_info.file)}")
    IO.puts("Module: #{inspect(compile_info.module)}")
    IO.puts("Function: #{inspect(compile_info.function)}")
    IO.puts("Line: #{inspect(compile_info.line)}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Node: #{inspect(compile_info.node)}")

    # 将信息保存到随机命名的.ex文件
    file_content = """
    # Compile-time information saved at #{compile_info.timestamp}
    %{
      file: #{inspect(compile_info.file)},
      module: #{inspect(compile_info.module)},
      function: #{inspect(compile_info.function)},
      line: #{inspect(compile_info.line)},
      timestamp: "#{compile_info.timestamp}",
      node: #{inspect(compile_info.node)}
    }
    """

    File.write(file_name, file_content)
    IO.puts("Compile-time information saved to #{file_name}")

    # 返回宏的值（这里简单返回:ok）
    quote do
      :ok
    end
  end
end
```

2. 在其他模块中使用宏：

```elixir
defmodule ExampleModule do
  require CompileInfo

  def example_function do
    CompileInfo.print_compile_info()
    "Example function executed"
  end
end
```

## 安装和运行

要运行此代码，您需要安装Elixir：

```bash
# 在Ubuntu/Debian系统上
curl -fsSL https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb -o erlang-solutions.deb
sudo dpkg -i erlang-solutions.deb
sudo apt update
sudo apt install -y esl-erlang elixir

# 运行测试
cd /workspace
elixir test_macro.exs
```

## 预期输出

当运行宏时，您应该看到类似以下的输出：

```
Compile-time information:
File: "/workspace/test_macro.exs"
Module: ExampleModule
Function: {:example_function, 0}
Line: 8
Timestamp: 2023-01-01T12:00:00.000000Z
Node: :nonode@nohost
Compile-time information saved to compile_info_a1b2c3d4e5f6.ex
```

同时，会创建一个随机命名的.ex文件，其中包含编译时信息。

## 注意事项

1. 该宏使用 `__CALLER__` 特殊形式来获取调用上下文信息
2. 随机文件名使用 `:crypto.strong_rand_bytes/1` 生成
3. 生成的文件将包含编译时的详细信息
4. 宏在编译时执行，因此信息反映的是编译时的状态，而不是运行时
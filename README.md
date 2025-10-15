# Elixir Compile-Time Logger

这是一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能

- 在编译时执行并打印信息
- 生成随机命名的.ex文件
- 将编译时信息保存到文件中
- 提供基本和高级版本

## 使用方法

### 基本用法

```elixir
defmodule Example do
  require CompileTimeLogger

  CompileTimeLogger.log_and_save("This is a compile-time message")

  def hello do
    "Hello from Example module"
  end
end
```

### 高级用法

```elixir
defmodule Example do
  require CompileTimeLogger

  CompileTimeLogger.log_and_save_advanced("Advanced compile-time message", 
                                          [author: "Developer", type: "debug"])

  def hello do
    "Hello from Example module"
  end
end
```

## 宏定义

### `log_and_save(message)`

- `message`: 要记录的消息

### `log_and_save_advanced(message, opts \\ [])`

- `message`: 要记录的消息
- `opts`: 可选的选项列表

## 工作原理

1. 生成一个随机的10字节文件名（转换为十六进制字符串）
2. 创建包含时间戳和消息内容的.ex文件
3. 在编译时打印相关信息到控制台
4. 将信息保存到随机命名的.ex文件中

## 示例输出

运行示例时，您会看到类似以下的输出：

```
Compile-time log: "This is a compile-time message"
Saved to: /workspace/f0fbbb8e0d963ccb8923.ex
```

同时会生成类似以下内容的.ex文件：

```elixir
# Generated at: 2025-10-15 11:45:49.491597Z
# Message: "This is a compile-time message"

# Compile-time log entry
```
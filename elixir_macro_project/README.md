# Elixir Compile-Time Information Macro

This project contains an Elixir macro that captures and prints compile-time information, then saves it to a randomly named `.ex` file.

## What the Macro Does

The `print_and_save_compile_info/1` macro:

1. Captures compile-time information including:
   - Module name
   - File path
   - Line number
   - Description provided by the user
   - Current timestamp
   - Node name

2. Prints this information to the console during compilation

3. Saves the information to a randomly named `.ex` file in the format `compile_info_[random_number].ex`

4. Creates a new module in that file that stores the compile-time information

## Implementation Details

The macro uses Elixir's `__CALLER__` macro to access compile-time information such as:
- `__CALLER__.module` - The module where the macro is called
- `__CALLER__.file` - The file where the macro is called
- `__CALLER__.line` - The line number where the macro is called

It generates a random suffix using `:rand.uniform(1000000)` to ensure the output file has a unique name.

## Usage

To use this macro:

1. Create an Elixir project
2. Include the `CompileInfoMacro` module
3. Require the macro in your module
4. Call `CompileInfoMacro.print_and_save_compile_info("description")`

Example:
```elixir
defmodule MyModule do
  require CompileInfoMacro
  
  CompileInfoMacro.print_and_save_compile_info("This is my module")
  
  def my_function do
    # your code here
  end
end
```

## Expected Output

When compiled, the macro will print information like:
```
Compile-time information:
  Module: MyModule
  File: /path/to/my_file.ex
  Line: 5
  Description: This is my module
  Timestamp: 2025-10-23T12:45:00Z
  Node: nonode@nohost
Compile-time information saved to: compile_info_123456.ex
```

And create a file named something like `compile_info_123456.ex` containing the stored information.
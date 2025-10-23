defmodule CompileInfoMacro do
  @moduledoc """
  Module containing a macro that prints compile-time information 
  and saves it to a randomly named .ex file.
  """

  defmacro print_and_save_compile_info(description) do
    # Get compile-time information
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    
    # Generate random filename
    random_suffix = :rand.uniform(1000000) |> Integer.to_string()
    random_filename = "compile_info_#{random_suffix}.ex"
    
    # Compile-time information to save
    compile_info = %{
      module: module,
      file: file,
      line: line,
      description: description,
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601(),
      node: Node.self()
    }
    
    # Print compile-time information
    IO.puts("Compile-time information:")
    IO.puts("  Module: #{inspect(compile_info.module)}")
    IO.puts("  File: #{compile_info.file}")
    IO.puts("  Line: #{compile_info.line}")
    IO.puts("  Description: #{compile_info.description}")
    IO.puts("  Timestamp: #{compile_info.timestamp}")
    IO.puts("  Node: #{compile_info.node}")
    
    # Save compile-time information to randomly named file
    file_content = """
    # Compile-time information saved at #{compile_info.timestamp}
    # Generated for module: #{inspect(compile_info.module)}
    # From file: #{compile_info.file}:#{compile_info.line}
    # Description: #{compile_info.description}
    
    defmodule CompileInfoStorage do
      def get_compile_info do
        unquote(Macro.escape(compile_info))
      end
    end
    """
    
    File.write(random_filename, file_content)
    IO.puts("Compile-time information saved to: #{random_filename}")
    
    # Return a simple expression since macros must return quoted expressions
    quote do
      unquote(description)
    end
  end
end

# Example usage of the macro
defmodule ExampleModule do
  require CompileInfoMacro
  
  CompileInfoMacro.print_and_save_compile_info("This is an example module")
  
  def hello do
    "Hello, World!"
  end
end
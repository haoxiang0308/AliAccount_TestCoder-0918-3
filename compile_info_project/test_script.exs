# 引入项目应用
Code.require_file("lib/compile_info_project.ex", __DIR__)

# 调用函数以测试宏
IO.puts("Calling test function...")
CompileInfoProject.test_function()

IO.puts("Test completed.")
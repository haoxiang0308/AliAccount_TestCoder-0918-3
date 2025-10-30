import std/[random, strutils, os, times]
import macros

# 定义一个宏，用于生成重复代码
macro generateRepeatedCode(count: static[int]): untyped =
  result = newNimNode(nnkStmtList)
  for i in 1..count:
    let repeatedCode = newCall("echo", newStrLitNode("Generated code line " & $i))
    result.add(repeatedCode)

# 另一个示例宏：生成重复的函数
macro generateRepeatedFunctions(count: static[int], prefix: static[string]): untyped =
  result = newNimNode(nnkStmtList)
  for i in 1..count:
    let funcName = prefix & $i
    let funcNode = newProc(
      name = newIdentNode(funcName),
      body = newCall("echo", newStrLitNode("Function " & funcName & " called"))
    )
    result.add(funcNode)

# 使用宏生成重复代码
generateRepeatedCode(5)

# 使用宏生成重复函数
generateRepeatedFunctions(3, "myFunc")

# 调用生成的函数
myFunc1()
myFunc2()
myFunc3()

# 保存宏生成的代码到随机命名的.nim文件
proc saveGeneratedCodeToFile() =
  # 生成随机文件名
  randomize()
  let randomFileName = "generated_code_" & $rand(10000) & ".nim"
  
  var codeContent = ""
  codeContent.add "# Auto-generated Nim code using macros\n"
  codeContent.add "# This file was generated on " & $now() & "\n\n"
  
  codeContent.add "import std/[random, strutils, times]\n\n"
  
  # 添加一个示例宏定义
  codeContent.add """# Example macro that generates repeated code
macro generateForLoop(count: static[int]): untyped =
  result = newNimNode(nnkStmtList)
  for i in 1..count:
    let stmt = newCall("echo", newStrLitNode("Loop iteration " & $i))
    result.add(stmt)

# Using the macro
generateForLoop(10)
"""
  
  # 写入文件
  writeFile(randomFileName, codeContent)
  echo "Generated code saved to: ", randomFileName

# 执行保存操作
saveGeneratedCodeToFile()
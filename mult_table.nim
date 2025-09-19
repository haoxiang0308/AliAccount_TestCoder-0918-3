import std/[random, os, strformat, times]

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:3} ")
    stdout.write("\n")

proc generateRandomFilename(): string =
  # Use current time as seed for randomness
  let seed = getTime().toUnix() and 0x7FFFFFFF
  randomize(seed)
  
  let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  var filename = ""
  for i in 1..10:
    let randomIndex = rand(chars.len-1)
    filename &= chars[randomIndex]
  return filename & ".nim"

let filename = generateRandomFilename()
echo "Saving to file: ", filename

let file = open(filename, fmWrite)
file.write("""
import strformat

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:3} ")
    stdout.write("\\n")

printMultiplicationTable(10)
""")
file.close()

echo "File saved. Now compiling and running..."

# Compile and run
if execShellCmd("nim c -r " & filename) != 0:
  echo "Compilation or execution failed"
else:
  echo "Program executed successfully"
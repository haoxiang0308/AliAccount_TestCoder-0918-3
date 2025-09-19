import random, os, strformat, times

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:3} ")
    stdout.write("\n")

proc generateRandomFilename(): string =
  # Use time-based seed for randomness
  let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  var filename = ""
  # Use nanosecond part of current time for pseudo-randomness
  let seed = int(getTime().nanosecond mod chars.len)
  # Ensure first character is a letter
  filename &= chars[seed mod 52]  # First 52 characters are letters
  for i in 2..10:
    let index = (seed * i) mod chars.len
    filename &= chars[index]
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

echo "File saved. Now compiling..."
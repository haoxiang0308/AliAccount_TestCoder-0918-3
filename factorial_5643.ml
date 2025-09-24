let rec factorial n =
  if n <= 1 then
    1
  else
    n * factorial (n - 1)

let () =
  print_endline (string_of_int (factorial 5))
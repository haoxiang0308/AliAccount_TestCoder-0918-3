let rec factorial n =
  if n <= 1 then
    1
  else
    n * factorial (n - 1)

let () =
  let result = factorial 5 in
  Printf.printf "Factorial of 5 is %d\n" result
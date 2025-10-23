(* OCaml program to calculate factorial recursively *)

let rec factorial n =
  if n <= 1 then
    1
  else
    n * factorial (n - 1)

let () =
  let result = factorial 5 in
  Printf.printf "Factorial of 5 is: %d\n" result;
  let result2 = factorial 0 in
  Printf.printf "Factorial of 0 is: %d\n" result2;
  let result3 = factorial 7 in
  Printf.printf "Factorial of 7 is: %d\n" result3
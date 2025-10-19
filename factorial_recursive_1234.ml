(* OCaml program to calculate factorial recursively *)

let rec factorial n =
  if n <= 1 then
    1
  else
    n * factorial (n - 1)

let () =
  print_endline "Factorial Calculator";
  print_endline "Enter a number to calculate its factorial:";
  let input = read_line () in
  let num = int_of_string input in
  let result = factorial num in
  Printf.printf "Factorial of %d is %d\n" num result
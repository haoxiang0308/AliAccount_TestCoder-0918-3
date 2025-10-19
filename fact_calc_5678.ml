(* OCaml program to calculate factorial recursively *)

let rec factorial n =
  if n <= 1 then
    1
  else
    n * factorial (n - 1)

(* Example usage *)
let () =
  Printf.printf "Factorial of 5 is %d\n" (factorial 5);
  Printf.printf "Factorial of 0 is %d\n" (factorial 0);
  Printf.printf "Factorial of 1 is %d\n" (factorial 1);
  Printf.printf "Factorial of 10 is %d\n" (factorial 10)
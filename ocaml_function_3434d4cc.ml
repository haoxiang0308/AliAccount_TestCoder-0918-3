(* A tail-recursive OCaml function that calculates the factorial of a number *)
let factorial n =
  let rec factorial_helper acc i =
    if i <= 1 then acc
    else factorial_helper (acc * i) (i - 1)
  in
  if n < 0 then 1  (* Factorial of negative numbers is undefined, returning 1 as default *)
  else factorial_helper 1 n

(* Example usage *)
let () =
  print_int (factorial 5);  (* Should print 120 *)
  print_newline ();
  print_int (factorial 0);  (* Should print 1 *)
  print_newline ()
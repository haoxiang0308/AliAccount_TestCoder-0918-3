(* Recursive factorial function in OCaml *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

(* Test the function *)
let () =
  let test_value = 5 in
  let result = factorial test_value in
  Printf.printf "Factorial of %d is %d\n" test_value result
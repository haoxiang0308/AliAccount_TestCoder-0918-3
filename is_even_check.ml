(* Function to check if a number is even *)
let is_even n =
  n mod 2 = 0

(* Test the function *)
let () =
  let test_number = 42 in
  if is_even test_number then
    Printf.printf "%d is even\n" test_number
  else
    Printf.printf "%d is odd\n" test_number
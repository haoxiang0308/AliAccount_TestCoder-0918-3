(* Function to check if a number is even *)
let is_even n = n mod 2 = 0

(* Example usage *)
let () =
  let number = 4 in
  if is_even number then
    Printf.printf "%d is even\n" number
  else
    Printf.printf "%d is odd\n" number
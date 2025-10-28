(* Function to check if a number is even *)
let is_even n = 
  n mod 2 = 0

(* Example usage *)
let () =
  let num = 4 in
  if is_even num then
    Printf.printf "%d is even\n" num
  else
    Printf.printf "%d is odd\n" num
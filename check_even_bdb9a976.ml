(* Function to check if a number is even *)
let is_even n = n mod 2 = 0;;

(* Example usage *)
print_endline (if is_even 4 then "4 is even" else "4 is odd");;
print_endline (if is_even 5 then "5 is even" else "5 is odd");;
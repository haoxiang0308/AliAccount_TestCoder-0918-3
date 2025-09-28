let is_even n = n mod 2 = 0

let () =
  print_endline (string_of_bool (is_even 4));
  print_endline (string_of_bool (is_even 7));
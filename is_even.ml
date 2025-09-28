let is_even n =
  n mod 2 = 0

let () =
  (* Пример использования *)
  print_endline (string_of_bool (is_even 4)); (* true *)
  print_endline (string_of_bool (is_even 7)); (* false *)
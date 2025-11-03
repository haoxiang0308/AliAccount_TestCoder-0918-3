(* OCaml module for mathematical functions *)
module Math = struct
  (* Basic arithmetic operations *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y
  
  (* Power and root functions *)
  let power base exponent = base ** exponent
  let square_root x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x
  
  (* Trigonometric functions *)
  let sine x = sin x
  let cosine x = cos x
  let tangent x = tan x
  
  (* Logarithmic functions *)
  let natural_log x = log x
  let log_base base value = (log value) /. (log base)
  let log10 x = log10 x
  
  (* Absolute value *)
  let absolute x = abs_float x
  
  (* Maximum and minimum *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y
  
  (* Factorial (integer version) *)
  let factorial n =
    if n < 0 then 
      failwith "Factorial of negative number"
    else
      let rec fact acc i = 
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n
  
  (* Check if number is prime *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisors i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check_divisors (i + 2)
      in check_divisors 3
end
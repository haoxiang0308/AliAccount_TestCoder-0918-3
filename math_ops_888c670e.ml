(* OCaml module encapsulating mathematical functions *)
module MathFunctions = struct
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
  let cube_root x = 
    if x >= 0.0 then 
      x ** (1.0 /. 3.0)
    else 
      ~-.((~-.x) ** (1.0 /. 3.0))

  (* Trigonometric functions *)
  let sine x = sin x
  let cosine x = cos x
  let tangent x = tan x

  (* Logarithmic functions *)
  let natural_log x = log x
  let log_base base x = (log x) /. (log base)
  let log10 x = log10 x

  (* Absolute value and sign *)
  let absolute x = abs_float x
  let sign x = 
    if x > 0.0 then 1.0
    else if x < 0.0 then -1.0
    else 0.0

  (* Maximum and minimum *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y

  (* Factorial (for non-negative integers) *)
  let factorial n = 
    if n < 0 then 
      failwith "Factorial of negative number"
    else
      let rec fact acc i = 
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n

  (* Greatest Common Divisor *)
  let gcd a b =
    let rec gcd_inner a b =
      if b = 0 then a
      else gcd_inner b (a mod b)
    in
    gcd_inner (abs a) (abs b)

  (* Least Common Multiple *)
  let lcm a b = 
    if a = 0 || b = 0 then 0
    else (abs (a * b)) / (gcd a b)
end

(* Example usage *)
let () = 
  Printf.printf "Example calculations using MathFunctions module:\n";
  Printf.printf "Addition: 5.0 + 3.0 = %f\n" (MathFunctions.add 5.0 3.0);
  Printf.printf "Square root of 16: %f\n" (MathFunctions.square_root 16.0);
  Printf.printf "Factorial of 5: %d\n" (MathFunctions.factorial 5);
  Printf.printf "GCD of 12 and 18: %d\n" (MathFunctions.gcd 12 18);
  Printf.printf "Pi: %f\n" (MathFunctions.multiply 4.0 (MathFunctions.atan 1.0))
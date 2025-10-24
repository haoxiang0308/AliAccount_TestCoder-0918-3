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

  (* Power and exponential functions *)
  let power base exponent = base ** exponent
  let square x = x *. x
  let cube x = x *. x *. x
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x

  (* Trigonometric functions *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x
  let asin x = asin x
  let acos x = acos x
  let atan x = atan x

  (* Logarithmic functions *)
  let ln x = log x
  let log10 x = log10 x
  let log_base base x = (log x) /. (log base)

  (* Constants *)
  let pi = 3.141592653589793238
  let e = 2.718281828459045235

  (* Other useful functions *)
  let abs x = abs_float x
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y
  let round x = floor (x +. 0.5)
  let floor x = floor x
  let ceil x = ceil x

  (* Factorial function for integers *)
  let factorial n =
    if n < 0 then
      failwith "Factorial of negative number"
    else
      let rec aux acc i =
        if i <= 1 then acc
        else aux (acc * i) (i - 1)
      in aux 1 n

  (* Greatest Common Divisor *)
  let gcd a b =
    let rec aux a b =
      if b = 0 then abs a
      else aux b (a mod b)
    in aux a b

  (* Least Common Multiple *)
  let lcm a b =
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)
end

(* Example usage *)
let () =
  Printf.printf "Math module example:\n";
  Printf.printf "2 + 3 = %f\n" (Math.add 2.0 3.0);
  Printf.printf "5 - 2 = %f\n" (Math.subtract 5.0 2.0);
  Printf.printf "4 * 3 = %f\n" (Math.multiply 4.0 3.0);
  Printf.printf "10 / 2 = %f\n" (Math.divide 10.0 2.0);
  Printf.printf "2^3 = %f\n" (Math.power 2.0 3.0);
  Printf.printf "Square root of 16 = %f\n" (Math.sqrt 16.0);
  Printf.printf "Sin of PI/2 = %f\n" (Math.sin (Math.pi /. 2.0));
  Printf.printf "Natural log of e = %f\n" (Math.ln Math.e);
  Printf.printf "Factorial of 5 = %d\n" (Math.factorial 5);
  Printf.printf "GCD of 12 and 8 = %d\n" (Math.gcd 12 8);
  Printf.printf "LCM of 12 and 8 = %d\n" (Math.lcm 12 8)
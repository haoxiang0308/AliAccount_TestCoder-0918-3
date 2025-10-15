(* OCaml module encapsulating mathematical functions *)
module Math = struct
  (* Basic arithmetic operations *)
  let add x y = x + y
  let subtract x y = x - y
  let multiply x y = x * y
  let divide x y = 
    if y = 0 then 
      failwith "Division by zero"
    else 
      x / y

  (* Power function *)
  let power base exp =
    let rec pow acc n =
      if n <= 0 then acc
      else pow (acc * base) (n - 1)
    in
    pow 1 exp

  (* Square root using Newton's method *)
  let sqrt x =
    if x < 0 then failwith "Square root of negative number"
    else if x = 0 then 0.0
    else
      let rec newton guess =
        let new_guess = (guess +. x /. guess) /. 2.0 in
        if abs_float (new_guess -. guess) < 0.000001 then new_guess
        else newton new_guess
      in
      newton 1.0

  (* Factorial *)
  let factorial n =
    let rec fact acc i =
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in
    if n < 0 then failwith "Factorial of negative number"
    else fact 1 n

  (* Greatest Common Divisor *)
  let gcd a b =
    let rec gcd_iter x y =
      if y = 0 then abs x
      else gcd_iter y (x mod y)
    in
    gcd_iter a b

  (* Absolute value *)
  let abs x = if x < 0 then -x else x

  (* Maximum of two values *)
  let max x y = if x > y then x else y

  (* Minimum of two values *)
  let min x y = if x < y then x else y

  (* Check if a number is prime *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisors i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check_divisors (i + 2)
      in
      check_divisors 3
end

(* Example usage *)
let () =
  Printf.printf "5 + 3 = %d\n" (Math.add 5 3);
  Printf.printf "10 - 4 = %d\n" (Math.subtract 10 4);
  Printf.printf "6 * 7 = %d\n" (Math.multiply 6 7);
  Printf.printf "15 / 3 = %d\n" (Math.divide 15 3);
  Printf.printf "2^8 = %d\n" (Math.power 2 8);
  Printf.printf "Square root of 16 = %f\n" (Math.sqrt 16.0);
  Printf.printf "Factorial of 5 = %d\n" (Math.factorial 5);
  Printf.printf "GCD of 48 and 18 = %d\n" (Math.gcd 48 18);
  Printf.printf "Is 17 prime? %b\n" (Math.is_prime 17)
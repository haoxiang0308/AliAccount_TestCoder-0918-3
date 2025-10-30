(* Define an algebraic data type for shapes *)
type shape = 
  | Circle of float (* radius *)
  | Rectangle of float * float (* width * height *)
  | Triangle of float * float * float (* three sides *)
  | Square of float (* side length *)
  | Pentagon of float (* side length, assuming regular pentagon *)

(* Example functions to work with shapes *)
let area = function
  | Circle r -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Square s -> s *. s
  | Triangle (a, b, c) -> 
      (* Using Heron's formula *)
      let s = (a +. b +. c) /. 2.0 in
      sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))
  | Pentagon s ->
      (* Area of regular pentagon: (1/4) * sqrt(25 + 10*sqrt(5)) * s^2 *)
      let sqrt5 = sqrt 5.0 in
      (25.0 +. 10.0 *. sqrt5) /. 4.0 *. s *. s

let perimeter = function
  | Circle r -> 2.0 *. 3.14159 *. r
  | Rectangle (w, h) -> 2.0 *. (w +. h)
  | Square s -> 4.0 *. s
  | Triangle (a, b, c) -> a +. b +. c
  | Pentagon s -> 5.0 *. s

(* Example usage *)
let () =
  let my_circle = Circle 5.0 in
  let my_square = Square 4.0 in
  let my_rectangle = Rectangle (3.0, 6.0) in
  
  Printf.printf "Circle area: %f\n" (area my_circle);
  Printf.printf "Square area: %f\n" (area my_square);
  Printf.printf "Rectangle area: %f\n" (area my_rectangle);
  
  Printf.printf "Circle perimeter: %f\n" (perimeter my_circle);
  Printf.printf "Square perimeter: %f\n" (perimeter my_square);
  Printf.printf "Rectangle perimeter: %f\n" (perimeter my_rectangle)
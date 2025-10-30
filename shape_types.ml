(* Define an algebraic data type for shapes in OCaml *)
type shape =
  | Circle of float          (* radius *)
  | Rectangle of float * float (* width * height *)
  | Triangle of float * float * float (* base * height * side *)
  | Square of float          (* side length *)
  | Pentagon of float        (* side length *)
  | Hexagon of float         (* side length *)

(* Example functions using the shape type *)
let area = function
  | Circle r -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (b, h, _) -> 0.5 *. b *. h
  | Square s -> s *. s
  | Pentagon s -> 1.72048 *. s *. s  (* approximate area *)
  | Hexagon s -> 2.59808 *. s *. s  (* approximate area *)

let perimeter = function
  | Circle r -> 2.0 *. 3.14159 *. r
  | Rectangle (w, h) -> 2.0 *. (w +. h)
  | Triangle (b, _, s) -> b +. s +. s  (* assuming isosceles *)
  | Square s -> 4.0 *. s
  | Pentagon s -> 5.0 *. s
  | Hexagon s -> 6.0 *. s
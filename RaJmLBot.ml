(* Define an algebraic data type for shapes *)
type shape = 
  | Circle of float (* radius *)
  | Rectangle of float * float (* width * height *)
  | Triangle of float * float * float (* three sides *)
  | Square of float (* side length *)
  | Pentagon of float (* side length, assuming regular pentagon *)


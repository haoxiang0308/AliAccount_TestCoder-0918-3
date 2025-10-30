(* Definición de un tipo algebraico en OCaml para representar formas *)
type shape = 
  | Circle of float  (* círculo con radio *)
  | Square of float  (* cuadrado con lado *)
  | Rectangle of float * float  (* rectángulo con ancho y alto *)
  | Triangle of float * float * float  (* triángulo con tres lados *)
  | Pentagon of float  (* pentágono regular con lado *)
  | Hexagon of float  (* hexágono regular con lado *)

(* Ejemplos de uso *)
let my_circle = Circle 5.0
let my_square = Square 4.0
let my_rectangle = Rectangle (3.0, 6.0)
let my_triangle = Triangle (3.0, 4.0, 5.0)
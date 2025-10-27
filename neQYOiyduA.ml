(* 数学函数模块 *)
module Math = struct
  (* 基本数学运算 *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then failwith "Division by zero"
    else x /. y

  (* 幂运算 *)
  let power base exponent = base ** exponent

  (* 开方运算 *)
  let sqrt x = 
    if x < 0.0 then failwith "Square root of negative number"
    else sqrt x

  (* 绝对值 *)
  let abs x = if x >= 0.0 then x else -. x

  (* 取最大值 *)
  let max x y = if x > y then x else y

  (* 取最小值 *)
  let min x y = if x < y then x else y

  (* 圆周率 *)
  let pi = 3.14159265358979323846

  (* 正弦函数 *)
  let sin x = sin x

  (* 余弦函数 *)
  let cos x = cos x

  (* 正切函数 *)
  let tan x = tan x

  (* 自然对数 *)
  let ln x = log x

  (* 以10为底的对数 *)
  let log10 x = log10 x

  (* 阶乘 *)
  let factorial n =
    if n < 0 then failwith "Factorial of negative number"
    else
      let rec fact acc i =
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in
      fact 1 n

  (* 求两个数的平均值 *)
  let average x y = (x +. y) /. 2.0

  (* 判断是否为质数 *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisor i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check_divisor (i + 2)
      in
      check_divisor 3
end
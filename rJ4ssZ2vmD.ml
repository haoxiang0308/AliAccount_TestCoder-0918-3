(* 数学函数模块 *)
module Math = struct
  (* 计算平方 *)
  let square x = x *. x

  (* 计算立方 *)
  let cube x = x *. x *. x

  (* 计算绝对值 *)
  let abs x = if x < 0.0 then -.x else x

  (* 计算两个数的最大值 *)
  let max x y = if x > y then x else y

  (* 计算两个数的最小值 *)
  let min x y = if x < y then x else y

  (* 计算幂次方 *)
  let power base exp = base ** exp

  (* 计算阶乘 *)
  let factorial n =
    let rec fact acc i =
      if i <= 0 then acc
      else fact (acc * i) (i - 1)
    in
    fact 1 n

  (* 计算两点间距离 *)
  let distance x1 y1 x2 y2 = 
    sqrt (((x2 -. x1) ** 2.0) +. ((y2 -. y1) ** 2.0))

  (* 判断一个数是否为质数 *)
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
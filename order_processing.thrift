namespace py gen

struct Order {
  1: i32 id,
  2: string customer_name,
  3: string product,
  4: i32 quantity,
  5: double price
}

exception OrderNotFound {
  1: string message
}

service OrderProcessor {
  bool place_order(1: Order order),
  Order get_order(1: i32 order_id) throws (1: OrderNotFound not_found),
  bool cancel_order(1: i32 order_id) throws (1: OrderNotFound not_found)
}
namespace java com.example.order
namespace py order_service

struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: string status,
  6: i64 created_at
}

exception OrderNotFoundException {
  1: string message
}

service OrderService {
  Order createOrder(1: string customer_name, 2: list<string> items, 3: double total_amount),
  Order getOrder(1: i64 order_id) throws (1: OrderNotFoundException e),
  bool updateOrderStatus(1: i64 order_id, 2: string status),
  list<Order> getAllOrders(),
  bool deleteOrder(1: i64 order_id) throws (1: OrderNotFoundException e)
}
namespace java com.example.orderservice
namespace py orderservice
namespace cpp orderservice

// Define an order item
struct OrderItem {
  1: i32 id,
  2: string name,
  3: i32 quantity,
  4: double price
}

// Define an order
struct Order {
  1: i32 id,
  2: list<OrderItem> items,
  3: string customerName,
  4: string customerEmail,
  5: string status,
  6: double totalAmount,
  7: i64 createdAt
}

// Exception for order-related errors
exception OrderException {
  1: string message
}

// The main order service
service OrderService {
  // Create a new order
  i32 createOrder(1: Order order) throws (1: OrderException ex),
  
  // Get an order by ID
  Order getOrder(1: i32 orderId) throws (1: OrderException ex),
  
  // Update an existing order
  bool updateOrder(1: Order order) throws (1: OrderException ex),
  
  // Cancel an order
  bool cancelOrder(1: i32 orderId) throws (1: OrderException ex),
  
  // Get all orders for a customer
  list<Order> getOrdersByCustomer(1: string customerEmail) throws (1: OrderException ex),
  
  // Get all orders with a specific status
  list<Order> getOrdersByStatus(1: string status) throws (1: OrderException ex)
}
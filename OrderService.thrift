namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Define an order item
struct OrderItem {
  1: i32 productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Define an order
struct Order {
  1: i64 orderId,
  2: string customerName,
  3: string customerEmail,
  4: list<OrderItem> items,
  5: double totalAmount,
  6: string status,
  7: i64 createdAt
}

// Exception for order-related errors
exception OrderException {
  1: string message,
  2: i32 errorCode
}

// Service definition for order processing
service OrderService {
  // Create a new order
  i64 createOrder(1: Order order) throws (1: OrderException ex),
  
  // Get order by ID
  Order getOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Update order status
  bool updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderException ex),
  
  // List all orders for a customer
  list<Order> getOrdersByCustomer(1: string customerEmail) throws (1: OrderException ex),
  
  // Cancel an order
  bool cancelOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Process payment for an order
  bool processPayment(1: i64 orderId) throws (1: OrderException ex)
}
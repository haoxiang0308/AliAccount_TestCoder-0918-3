namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Define an Order struct
struct Order {
  1: i64 id,
  2: string customerName,
  3: string customerEmail,
  4: list<OrderItem> items,
  5: double totalAmount,
  6: string status,
  7: i64 createdAt,
  8: i64 updatedAt
}

// Define an OrderItem struct
struct OrderItem {
  1: i64 productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Define a request struct for creating orders
struct CreateOrderRequest {
  1: string customerName,
  2: string customerEmail,
  3: list<OrderItem> items
}

// Define a response struct for order operations
struct OrderResponse {
  1: bool success,
  2: string message,
  3: Order order
}

// Define the main OrderService
service OrderService {
  // Create a new order
  OrderResponse createOrder(1: CreateOrderRequest request),
  
  // Get an order by ID
  OrderResponse getOrder(1: i64 orderId),
  
  // Update order status
  OrderResponse updateOrderStatus(1: i64 orderId, 2: string status),
  
  // Get all orders for a customer
  list<Order> getOrdersByCustomer(1: string customerEmail),
  
  // Cancel an order
  OrderResponse cancelOrder(1: i64 orderId)
}
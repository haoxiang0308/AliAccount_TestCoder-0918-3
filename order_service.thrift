namespace java com.example.orderservice
namespace py order_service

// Enum for order status
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    SHIPPED = 3,
    DELIVERED = 4,
    CANCELLED = 5
}

// Struct for order items
struct OrderItem {
    1: i32 productId,
    2: string productName,
    3: i32 quantity,
    4: double price
}

// Struct for orders
struct Order {
    1: i64 orderId,
    2: i64 userId,
    3: list<OrderItem> items,
    4: double totalAmount,
    5: OrderStatus status,
    6: i64 createdAt,
    7: i64 updatedAt
}

// Exception for order not found
exception OrderNotFoundException {
    1: string message
}

// Exception for invalid order
exception InvalidOrderException {
    1: string message
}

// Main service definition
service OrderService {
    // Create a new order
    i64 createOrder(1: Order order) throws (1: InvalidOrderException e),
    
    // Get order by ID
    Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
    
    // Update order status
    void updateOrderStatus(1: i64 orderId, 2: OrderStatus status) throws (1: OrderNotFoundException e),
    
    // Cancel an order
    void cancelOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
    
    // Get all orders for a user
    list<Order> getOrdersByUser(1: i64 userId),
    
    // List all orders (admin function)
    list<Order> getAllOrders()
}
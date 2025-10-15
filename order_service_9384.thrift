// Order Processing Service Definition
namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Order status enumeration
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    PROCESSING = 3,
    SHIPPED = 4,
    DELIVERED = 5,
    CANCELLED = 6
}

// Product structure
struct Product {
    1: i32 id,
    2: string name,
    3: double price,
    4: i32 quantity
}

// Address structure
struct Address {
    1: string street,
    2: string city,
    3: string state,
    4: string zipCode,
    5: string country
}

// Order item structure
struct OrderItem {
    1: Product product,
    2: i32 quantity
}

// Order structure
struct Order {
    1: i64 orderId,
    2: list<OrderItem> items,
    3: Address shippingAddress,
    4: double totalAmount,
    5: OrderStatus status,
    6: string customerId,
    7: i64 createdAt,
    8: i64 updatedAt
}

// Response structure
struct OrderResponse {
    1: bool success,
    2: string message,
    3: Order order
}

// Exception for order-related errors
exception OrderException {
    1: string message,
    2: i32 errorCode
}

// Main order service
service OrderService {
    // Create a new order
    OrderResponse createOrder(1: Order order) throws (1: OrderException ex),
    
    // Get order by ID
    OrderResponse getOrder(1: i64 orderId) throws (1: OrderException ex),
    
    // Update order status
    OrderResponse updateOrderStatus(1: i64 orderId, 2: OrderStatus status) throws (1: OrderException ex),
    
    // Cancel an order
    OrderResponse cancelOrder(1: i64 orderId) throws (1: OrderException ex),
    
    // List all orders for a customer
    list<Order> getOrdersByCustomer(1: string customerId) throws (1: OrderException ex),
    
    // Get all orders
    list<Order> getAllOrders() throws (1: OrderException ex)
}
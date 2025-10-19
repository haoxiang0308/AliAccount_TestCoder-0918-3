namespace java com.example.order
namespace php order
namespace py order

// Типы данных для заказа
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

struct OrderItem {
  1: i64 productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

struct OrderRequest {
  1: string customerName,
  2: string customerEmail,
  3: list<OrderItem> items
}

struct OrderResponse {
  1: bool success,
  2: string message,
  3: Order order
}

exception OrderException {
  1: string message
}

// Сервис для обработки заказов
service OrderService {
  // Создать новый заказ
  OrderResponse createOrder(1: OrderRequest request) throws (1: OrderException ex),
  
  // Получить заказ по ID
  OrderResponse getOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Обновить статус заказа
  bool updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderException ex),
  
  // Получить все заказы клиента
  list<Order> getOrdersByCustomer(1: string customerEmail) throws (1: OrderException ex),
  
  // Отменить заказ
  bool cancelOrder(1: i64 orderId) throws (1: OrderException ex)
}
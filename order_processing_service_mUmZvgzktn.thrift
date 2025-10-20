// Определение структур данных для сервиса обработки заказов

// Статусы заказа
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  PROCESSING = 3,
  SHIPPED = 4,
  DELIVERED = 5,
  CANCELLED = 6
}

// Структура для представления товара в заказе
struct OrderItem {
  1: required i32 productId,
  2: required string productName,
  3: required i32 quantity,
  4: required double price
}

// Структура для представления заказа
struct Order {
  1: required i64 orderId,
  2: required string customerId,
  3: required list<OrderItem> items,
  4: required double totalAmount,
  5: required OrderStatus status,
  6: required string createdAt,
  7: optional string updatedAt
}

// Структура для ответа на операции
struct OperationResponse {
  1: required bool success,
  2: optional string message,
  3: optional Order order
}

// Определение сервиса обработки заказов
service OrderProcessingService {
  // Создать новый заказ
  OperationResponse createOrder(1: Order order),
  
  // Получить заказ по ID
  OperationResponse getOrder(1: i64 orderId),
  
  // Обновить статус заказа
  OperationResponse updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus),
  
  // Отменить заказ
  OperationResponse cancelOrder(1: i64 orderId),
  
  // Получить список заказов клиента
  list<Order> getCustomerOrders(1: string customerId),
  
  // Получить все заказы
  list<Order> getAllOrders()
}
namespace java com.example.order

// Тип перечисления для статуса заказа
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Структура для элемента заказа
struct OrderItem {
  1: required i64 productId,
  2: required i32 quantity,
  3: required double price
}

// Структура для заказа
struct Order {
  1: required i64 orderId,
  2: required string customerId,
  3: required list<OrderItem> items,
  4: required double totalAmount,
  5: required OrderStatus status,
  6: optional string address,
  7: optional string notes
}

// Исключение для ошибок, связанных с заказом
exception OrderException {
  1: string message
}

// Сервис для обработки заказов
service OrderService {

  // Создать новый заказ
  Order createOrder(1: Order order) throws (1: OrderException oex),

  // Получить информацию о заказе по ID
  Order getOrder(1: i64 orderId) throws (1: OrderException oex),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus) throws (1: OrderException oex),

  // Получить все заказы клиента
  list<Order> getOrdersByCustomer(1: string customerId) throws (1: OrderException oex)
}
namespace java com.example.orders
namespace py orderservice

// Структура заказа
struct Order {
  1: i64 orderId,
  2: string customerName,
  3: string customerEmail,
  4: list<OrderItem> items,
  5: double totalAmount,
  6: string status,
  7: i64 timestamp
}

// Структура элемента заказа
struct OrderItem {
  1: i64 productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Структура для ответа на запросы
struct OrderResponse {
  1: bool success,
  2: string message,
  3: Order order
}

// Исключение для обработки ошибок
exception OrderException {
  1: i32 errorCode,
  2: string message
}

// Сервис обработки заказов
service OrderService {
  // Создание нового заказа
  OrderResponse createOrder(1: Order order) throws (1: OrderException ex),
  
  // Получение заказа по ID
  Order getOrderById(1: i64 orderId) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  OrderResponse updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderException ex),
  
  // Получение всех заказов клиента
  list<Order> getOrdersByCustomer(1: string customerEmail) throws (1: OrderException ex),
  
  // Отмена заказа
  OrderResponse cancelOrder(1: i64 orderId) throws (1: OrderException ex)
}
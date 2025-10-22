namespace java com.example.orderservice
namespace py order_service

// Определение структуры продукта
struct Product {
  1: i32 id,
  2: string name,
  3: double price,
  4: i32 quantity
}

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: list<Product> products,
  3: string customerName,
  4: string customerEmail,
  5: string status,
  6: i64 createdAt
}

// Исключение для ошибок сервиса
exception OrderException {
  1: string message
}

// Определение сервиса для обработки заказов
service OrderService {
  // Создать новый заказ
  i64 createOrder(1: Order order) throws (1: OrderException ex),
  
  // Получить заказ по ID
  Order getOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Обновить статус заказа
  void updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderException ex),
  
  // Получить список всех заказов
  list<Order> getAllOrders() throws (1: OrderException ex),
  
  // Удалить заказ
  void deleteOrder(1: i64 orderId) throws (1: OrderException ex)
}
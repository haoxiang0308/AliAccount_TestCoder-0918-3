namespace java com.example.orderservice
namespace py order_service

// Определение структуры для элемента заказа
struct OrderItem {
    1: i32 productId,
    2: i32 quantity,
    3: double price
}

// Определение структуры для заказа
struct Order {
    1: i64 orderId,
    2: list<OrderItem> items,
    3: double totalAmount,
    4: string status,
    5: string createdAt
}

// Определение исключения для случая, если заказ не найден
exception OrderNotFoundException {
    1: string message
}

// Определение сервиса для обработки заказов
service OrderService {
    // Создать новый заказ
    i64 createOrder(1: list<OrderItem> items) throws (1: OrderNotFoundException notFound),
    
    // Получить заказ по ID
    Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException notFound),
    
    // Обновить статус заказа
    bool updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderNotFoundException notFound),
    
    // Отменить заказ
    bool cancelOrder(1: i64 orderId) throws (1: OrderNotFoundException notFound)
}
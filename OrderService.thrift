// OrderService.thrift

// Определение типа для ID заказа
typedef i64 OrderId

// Структура заказа
struct Order {
    1: required OrderId order_id,
    2: required i64 user_id,
    3: required double amount,
    4: optional string description
}

// Исключение для несуществующего заказа
exception OrderNotFound {
    1: OrderId order_id
}

// Сервис обработки заказов
service OrderService {
    // Метод для создания нового заказа
    OrderId createOrder(1: i64 user_id, 2: double amount, 3: string description),

    // Метод для получения информации о заказе
    Order getOrder(1: OrderId order_id) throws (1: OrderNotFound not_found),

    // Метод для обработки оплаты заказа
    bool processPayment(1: OrderId order_id) throws (1: OrderNotFound not_found)
}
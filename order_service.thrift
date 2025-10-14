namespace py gen_py
namespace java gen_java

// Определение типа данных для элемента заказа
struct OrderItem {
    1: i64 productId,
    2: i32 quantity,
    3: string name,
    4: double price
}

// Определение типа данных для заказа
struct Order {
    1: i64 orderId,
    2: list<OrderItem> items,
    3: string customerEmail,
    4: double totalAmount,
    5: string status // e.g., "PENDING", "CONFIRMED", "SHIPPED"
}

// Определение исключения
exception OrderNotFoundException {
    1: string message
}

exception InvalidOrderException {
    1: string message
}

// Определение сервиса
service OrderService {
    // Создать новый заказ
    Order createOrder(1: list<OrderItem> items, 2: string customerEmail) throws (1: InvalidOrderException e),

    // Получить заказ по ID
    Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),

    // Обновить статус заказа
    void updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderNotFoundException e),

    // Подсчитать общую сумму заказа
    double calculateTotal(1: list<OrderItem> items)
}
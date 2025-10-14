namespace py gen_py
namespace java gen_java

// Тип статуса заказа
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    SHIPPED = 3,
    DELIVERED = 4,
    CANCELLED = 5
}

// Структура заказа
struct Order {
    1: i64 id,
    2: string customer_name,
    3: string customer_email,
    4: list<OrderItem> items,
    5: double total_amount,
    6: OrderStatus status = OrderStatus.PENDING,
    7: i64 timestamp
}

// Структура элемента заказа
struct OrderItem {
    1: i64 product_id,
    2: string product_name,
    3: i32 quantity,
    4: double price
}

// Исключение для ошибок сервиса
exception OrderException {
    1: string message
}

// Сервис обработки заказов
service OrderService {
    // Создать новый заказ
    Order create_order(1: Order order) throws (1: OrderException ex),

    // Получить заказ по ID
    Order get_order(1: i64 order_id) throws (1: OrderException ex),

    // Обновить статус заказа
    void update_order_status(1: i64 order_id, 2: OrderStatus new_status) throws (1: OrderException ex),

    // Получить все заказы клиента
    list<Order> get_orders_by_customer(1: string customer_email) throws (1: OrderException ex)
}
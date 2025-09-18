namespace py order_service

// Структура для представления заказа
struct Order {
    1: i32 id,
    2: string customer_name,
    3: list<string> items,
    4: double total_amount,
    5: string status,
}

// Структура для запроса создания заказа
struct CreateOrderRequest {
    1: string customer_name,
    2: list<string> items,
    3: double total_amount,
}

// Исключение для обработки ошибок
exception OrderException {
    1: i32 error_code,
    2: string message,
}

// Сервис для обработки заказов
service OrderService {
    // Создание нового заказа
    Order createOrder(1: CreateOrderRequest request) throws (1: OrderException ex),
    
    // Получение заказа по ID
    Order getOrder(1: i32 id) throws (1: OrderException ex),
    
    // Обновление статуса заказа
    bool updateOrderStatus(1: i32 id, 2: string status) throws (1: OrderException ex),
    
    // Получение всех заказов клиента
    list<Order> getOrdersByCustomer(1: string customer_name) throws (1: OrderException ex),
}
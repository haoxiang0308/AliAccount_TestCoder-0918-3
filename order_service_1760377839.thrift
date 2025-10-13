// order_service_1760377839.thrift

namespace py generated_order_service
namespace java generated.order.service

// Структура для представления заказа
struct Order {
  1: required i64 id,
  2: required string customer_name,
  3: required string product,
  4: required i32 quantity,
  5: required double total_amount,
  6: optional string status = "pending" // Статус по умолчанию
}

// Исключение для случая, если заказ не найден
exception OrderNotFoundException {
  1: i64 order_id
}

// Сервис для обработки заказов
service OrderService {
  // Получить детали заказа по ID
  Order getOrder(1: i64 order_id) throws (1: OrderNotFoundException not_found),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 order_id, 2: string new_status) throws (1: OrderNotFoundException not_found),

  // Создать новый заказ
  i64 createOrder(1: Order new_order)
}
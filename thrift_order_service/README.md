# Thrift Order Service

## Описание

Этот проект представляет собой реализацию сервиса обработки заказов с использованием Apache Thrift. Сервис предоставляет функции для создания, получения, обновления и отмены заказов.

## Структура проекта

- `order_service.thrift` - Определение Thrift сервиса
- `server/` - Реализация сервера
- `client/` - Реализация клиента
- `gen-py/` - Директория для сгенерированного кода (при наличии Thrift компилятора)

## Определение сервиса

В файле `order_service.thrift` определены следующие структуры и сервисы:

### Структуры данных

1. **OrderItem** - Элемент заказа
   - productId (i64): ID продукта
   - productName (string): Название продукта
   - quantity (i32): Количество
   - price (double): Цена

2. **Order** - Заказ
   - orderId (i64): ID заказа
   - customerName (string): Имя клиента
   - customerEmail (string): Email клиента
   - items (list<OrderItem>): Список элементов заказа
   - totalAmount (double): Общая сумма
   - status (string): Статус заказа
   - timestamp (i64): Временная метка создания

3. **OrderResponse** - Ответ на запросы
   - success (bool): Флаг успешности операции
   - message (string): Сообщение
   - order (Order): Объект заказа (если применимо)

4. **OrderException** - Исключение
   - errorCode (i32): Код ошибки
   - message (string): Сообщение об ошибке

### Методы сервиса

1. **createOrder(Order order)** - Создание нового заказа
2. **getOrderById(i64 orderId)** - Получение заказа по ID
3. **updateOrderStatus(i64 orderId, string status)** - Обновление статуса заказа
4. **getOrdersByCustomer(string customerEmail)** - Получение всех заказов клиента
5. **cancelOrder(i64 orderId)** - Отмена заказа

## Запуск сервиса

Для запуска сервера выполните:

```bash
cd thrift_order_service
python server/order_server.py
```

## Использование клиента

Для запуска клиента выполните:

```bash
cd thrift_order_service
python client/order_client.py
```

## Требования

- Python 3.x
- thrift библиотека (устанавливается через pip install thrift)

## Замечания

В текущей реализации сервер и клиент используют прямые вызовы методов вместо сетевого взаимодействия через Thrift протокол, так как компилятор Thrift не установлен. При наличии компилятора Thrift, можно сгенерировать код для сервера и клиента с помощью команды:

```bash
thrift -r --gen py order_service.thrift
```

Это создаст необходимые классы и стабы для полноценного RPC взаимодействия.
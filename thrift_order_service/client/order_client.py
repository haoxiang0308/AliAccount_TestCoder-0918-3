#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import time

# Имитация сгенерированных Thrift классов (дубликаты для клиента)
class OrderItem:
    def __init__(self, productId=0, productName="", quantity=0, price=0.0):
        self.productId = productId
        self.productName = productName
        self.quantity = quantity
        self.price = price

class Order:
    def __init__(self, orderId=0, customerName="", customerEmail="", items=None, totalAmount=0.0, status="NEW", timestamp=0):
        self.orderId = orderId
        self.customerName = customerName
        self.customerEmail = customerEmail
        self.items = items if items is not None else []
        self.totalAmount = totalAmount
        self.status = status
        self.timestamp = timestamp

class OrderResponse:
    def __init__(self, success=False, message="", order=None):
        self.success = success
        self.message = message
        self.order = order

class OrderException(Exception):
    def __init__(self, errorCode=0, message=""):
        self.errorCode = errorCode
        self.message = message
        super().__init__(self.message)

# Клиент для сервиса обработки заказов
class OrderServiceClient:
    def __init__(self, server_handler):
        # В реальной реализации здесь был бы thrift client
        # Для демонстрации используем напрямую handler сервера
        self.server_handler = server_handler
    
    def createOrder(self, order: Order) -> OrderResponse:
        """Создание нового заказа"""
        return self.server_handler.createOrder(order)
    
    def getOrderById(self, orderId: int) -> Order:
        """Получение заказа по ID"""
        return self.server_handler.getOrderById(orderId)
    
    def updateOrderStatus(self, orderId: int, status: str) -> OrderResponse:
        """Обновление статуса заказа"""
        return self.server_handler.updateOrderStatus(orderId, status)
    
    def getOrdersByCustomer(self, customerEmail: str) -> list:
        """Получение всех заказов клиента"""
        return self.server_handler.getOrdersByCustomer(customerEmail)
    
    def cancelOrder(self, orderId: int) -> OrderResponse:
        """Отмена заказа"""
        return self.server_handler.cancelOrder(orderId)

# Демонстрационный клиент
def main():
    print("Order Service Client Demo")
    print("=" * 30)
    
    # В реальной реализации здесь был бы thrift client
    # Для демонстрации создаем серверный handler и используем его напрямую
    sys.path.append('/workspace/thrift_order_service')
    from server.order_server import OrderServiceHandler
    handler = OrderServiceHandler()
    client = OrderServiceClient(handler)
    
    try:
        # Создаем заказ
        print("1. Creating a new order...")
        item1 = OrderItem(productId=101, productName="Smartphone", quantity=1, price=800.0)
        item2 = OrderItem(productId=102, productName="Headphones", quantity=1, price=150.0)
        
        order = Order(
            customerName="Alice Smith",
            customerEmail="alice@example.com",
            items=[item1, item2]
        )
        
        response = client.createOrder(order)
        if response.success:
            print(f"   Success: {response.message}")
            print(f"   Order ID: {response.order.orderId}")
            print(f"   Total amount: ${response.order.totalAmount}")
            order_id = response.order.orderId
        else:
            print(f"   Failed: {response.message}")
            return
        
        # Получаем заказ по ID
        print("\n2. Retrieving order by ID...")
        retrieved_order = client.getOrderById(order_id)
        print(f"   Order ID: {retrieved_order.orderId}")
        print(f"   Customer: {retrieved_order.customerName}")
        print(f"   Status: {retrieved_order.status}")
        print(f"   Items: {len(retrieved_order.items)}")
        for item in retrieved_order.items:
            print(f"     - {item.productName} x{item.quantity} (${item.price} each)")
        
        # Обновляем статус заказа
        print("\n3. Updating order status...")
        update_response = client.updateOrderStatus(order_id, "SHIPPED")
        if update_response.success:
            print(f"   Success: {update_response.message}")
        else:
            print(f"   Failed: {update_response.message}")
        
        # Получаем заказы клиента
        print("\n4. Retrieving customer orders...")
        customer_orders = client.getOrdersByCustomer("alice@example.com")
        print(f"   Found {len(customer_orders)} order(s) for customer")
        for order in customer_orders:
            print(f"   - Order #{order.orderId}: {order.status} (${order.totalAmount})")
        
        # Отменяем заказ
        print("\n5. Cancelling order...")
        cancel_response = client.cancelOrder(order_id)
        if cancel_response.success:
            print(f"   Success: {cancel_response.message}")
        else:
            print(f"   Failed: {cancel_response.message}")
            
        # Пытаемся отменить уже отмененный заказ
        print("\n6. Trying to cancel already cancelled order...")
        try:
            cancel_response = client.cancelOrder(order_id)
            print(f"   Unexpected success: {cancel_response.message}")
        except OrderException as e:
            print(f"   Expected error: [{e.errorCode}] {e.message}")
            
    except OrderException as e:
        print(f"Service error: [{e.errorCode}] {e.message}")
    except Exception as e:
        print(f"Unexpected error: {str(e)}")

if __name__ == "__main__":
    main()
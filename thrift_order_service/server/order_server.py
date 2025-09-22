#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import time
from typing import Dict, List

# Имитация сгенерированных Thrift классов
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

# Реализация сервиса обработки заказов
class OrderServiceHandler:
    def __init__(self):
        # Имитация базы данных заказов
        self.orders: Dict[int, Order] = {}
        self.next_order_id = 1
    
    def createOrder(self, order: Order) -> OrderResponse:
        """Создание нового заказа"""
        try:
            # Назначаем ID и временную метку
            order.orderId = self.next_order_id
            order.timestamp = int(time.time())
            
            # Рассчитываем общую сумму
            total = sum(item.quantity * item.price for item in order.items)
            order.totalAmount = total
            
            # Сохраняем заказ
            self.orders[order.orderId] = order
            self.next_order_id += 1
            
            return OrderResponse(success=True, message="Order created successfully", order=order)
        except Exception as e:
            raise OrderException(errorCode=1001, message=f"Failed to create order: {str(e)}")
    
    def getOrderById(self, orderId: int) -> Order:
        """Получение заказа по ID"""
        if orderId not in self.orders:
            raise OrderException(errorCode=1002, message=f"Order with ID {orderId} not found")
        return self.orders[orderId]
    
    def updateOrderStatus(self, orderId: int, status: str) -> OrderResponse:
        """Обновление статуса заказа"""
        if orderId not in self.orders:
            raise OrderException(errorCode=1002, message=f"Order with ID {orderId} not found")
        
        self.orders[orderId].status = status
        return OrderResponse(success=True, message=f"Order status updated to {status}", order=self.orders[orderId])
    
    def getOrdersByCustomer(self, customerEmail: str) -> List[Order]:
        """Получение всех заказов клиента"""
        customer_orders = [order for order in self.orders.values() if order.customerEmail == customerEmail]
        return customer_orders
    
    def cancelOrder(self, orderId: int) -> OrderResponse:
        """Отмена заказа"""
        if orderId not in self.orders:
            raise OrderException(errorCode=1002, message=f"Order with ID {orderId} not found")
        
        if self.orders[orderId].status == "CANCELLED":
            raise OrderException(errorCode=1003, message=f"Order {orderId} is already cancelled")
        
        self.orders[orderId].status = "CANCELLED"
        return OrderResponse(success=True, message="Order cancelled successfully", order=self.orders[orderId])

# Простой сервер для демонстрации
class OrderServiceServer:
    def __init__(self):
        self.handler = OrderServiceHandler()
    
    def start(self):
        print("Order Service Server started on port 9090")
        print("Available methods:")
        print("- createOrder(order)")
        print("- getOrderById(orderId)")
        print("- updateOrderStatus(orderId, status)")
        print("- getOrdersByCustomer(customerEmail)")
        print("- cancelOrder(orderId)")
        print("\nServer is running... (Press Ctrl+C to stop)")
        
        # Демонстрация работы сервиса
        try:
            # Создаем тестовый заказ
            item1 = OrderItem(productId=1, productName="Laptop", quantity=1, price=1200.0)
            item2 = OrderItem(productId=2, productName="Mouse", quantity=2, price=25.0)
            
            test_order = Order(
                customerName="John Doe",
                customerEmail="john@example.com",
                items=[item1, item2]
            )
            
            # Создаем заказ
            response = self.handler.createOrder(test_order)
            print(f"\nCreated order: {response.message}")
            print(f"Order ID: {response.order.orderId}")
            print(f"Total amount: ${response.order.totalAmount}")
            
            # Получаем заказ по ID
            order = self.handler.getOrderById(response.order.orderId)
            print(f"\nRetrieved order ID {order.orderId} with status: {order.status}")
            
            # Обновляем статус заказа
            update_response = self.handler.updateOrderStatus(order.orderId, "PROCESSING")
            print(f"\n{update_response.message}")
            
            # Получаем заказы клиента
            customer_orders = self.handler.getOrdersByCustomer("john@example.com")
            print(f"\nCustomer has {len(customer_orders)} order(s)")
            
            # Отменяем заказ
            cancel_response = self.handler.cancelOrder(order.orderId)
            print(f"\n{cancel_response.message}")
            
        except OrderException as e:
            print(f"Service error: [{e.errorCode}] {e.message}")
        except Exception as e:
            print(f"Unexpected error: {str(e)}")

if __name__ == "__main__":
    server = OrderServiceServer()
    server.start()
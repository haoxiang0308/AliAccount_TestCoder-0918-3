#!/usr/bin/env python3

import sys
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
    # Создаем подключение к серверу
    transport = TSocket.TSocket('127.0.0.1', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = OrderService.Client(protocol)
    
    # Открываем соединение
    transport.open()
    
    try:
        # Создаем новый заказ
        print("Creating a new order...")
        request = CreateOrderRequest(
            customer_name="John Doe",
            items=["Pizza", "Coke", "Salad"],
            total_amount=25.50
        )
        order = client.createOrder(request)
        print(f"Created order: {order}")
        
        # Получаем заказ по ID
        print("\nRetrieving order by ID...")
        retrieved_order = client.getOrder(order.id)
        print(f"Retrieved order: {retrieved_order}")
        
        # Обновляем статус заказа
        print("\nUpdating order status...")
        success = client.updateOrderStatus(order.id, "CONFIRMED")
        if success:
            updated_order = client.getOrder(order.id)
            print(f"Updated order: {updated_order}")
        
        # Создаем еще один заказ для того же клиента
        print("\nCreating another order for the same customer...")
        request2 = CreateOrderRequest(
            customer_name="John Doe",
            items=["Burger", "Fries"],
            total_amount=12.75
        )
        order2 = client.createOrder(request2)
        print(f"Created second order: {order2}")
        
        # Получаем все заказы клиента
        print("\nRetrieving all orders for customer...")
        customer_orders = client.getOrdersByCustomer("John Doe")
        for o in customer_orders:
            print(f"Customer order: {o}")
            
    except OrderException as e:
        print(f"OrderException: {e.error_code} - {e.message}")
    except Thrift.TException as e:
        print(f"Thrift exception: {e.message}")
    finally:
        # Закрываем соединение
        transport.close()

if __name__ == '__main__':
    main()
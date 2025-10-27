#!/usr/bin/env python3
"""
Thrift Order Service Implementation
This file implements the OrderService defined in orderservice.thrift
"""

import sys
import random
from datetime import datetime

# Define the data structures based on the Thrift definition
class OrderItem:
    def __init__(self, id=0, name="", quantity=0, price=0.0):
        self.id = id
        self.name = name
        self.quantity = quantity
        self.price = price

class Order:
    def __init__(self, id=0, items=None, customerName="", customerEmail="", status="", totalAmount=0.0, createdAt=0):
        self.id = id
        self.items = items if items is not None else []
        self.customerName = customerName
        self.customerEmail = customerEmail
        self.status = status
        self.totalAmount = totalAmount
        self.createdAt = createdAt

class OrderException(Exception):
    def __init__(self, message=""):
        self.message = message
        super().__init__(self.message)


# Mock database for orders
orders_db = {}
order_id_counter = 1


class OrderServiceHandler:
    def __init__(self):
        pass

    def createOrder(self, order):
        """Create a new order and return its ID"""
        global order_id_counter
        
        # Assign a new ID to the order
        order.id = order_id_counter
        order_id_counter += 1
        
        # Set creation time
        order.createdAt = int(datetime.now().timestamp())
        
        # Set initial status
        if not order.status:
            order.status = "PENDING"
        
        # Calculate total amount
        total = 0
        for item in order.items:
            total += item.price * item.quantity
        order.totalAmount = total
        
        # Save to mock database
        orders_db[order.id] = order
        
        print(f"Created order with ID: {order.id}")
        return order.id

    def getOrder(self, orderId):
        """Get an order by its ID"""
        if orderId not in orders_db:
            raise OrderException(f"Order with ID {orderId} not found")
        return orders_db[orderId]

    def updateOrder(self, order):
        """Update an existing order"""
        if order.id not in orders_db:
            raise OrderException(f"Order with ID {order.id} not found")
        
        # Update the order
        orders_db[order.id] = order
        print(f"Updated order with ID: {order.id}")
        return True

    def cancelOrder(self, orderId):
        """Cancel an order by setting its status to CANCELLED"""
        if orderId not in orders_db:
            raise OrderException(f"Order with ID {orderId} not found")
        
        order = orders_db[orderId]
        order.status = "CANCELLED"
        print(f"Cancelled order with ID: {orderId}")
        return True

    def getOrdersByCustomer(self, customerEmail):
        """Get all orders for a specific customer"""
        customer_orders = []
        for order in orders_db.values():
            if order.customerEmail == customerEmail:
                customer_orders.append(order)
        return customer_orders

    def getOrdersByStatus(self, status):
        """Get all orders with a specific status"""
        status_orders = []
        for order in orders_db.values():
            if order.status == status:
                status_orders.append(order)
        return status_orders


# Example usage and testing
if __name__ == "__main__":
    handler = OrderServiceHandler()
    
    # Create a sample order
    item1 = OrderItem()
    item1.id = 1
    item1.name = "Widget A"
    item1.quantity = 2
    item1.price = 19.99
    
    item2 = OrderItem()
    item2.id = 2
    item2.name = "Gadget B"
    item2.quantity = 1
    item2.price = 49.99
    
    order = Order()
    order.items = [item1, item2]
    order.customerName = "John Doe"
    order.customerEmail = "john@example.com"
    order.status = ""
    
    # Create the order
    order_id = handler.createOrder(order)
    print(f"Created order with ID: {order_id}")
    
    # Retrieve the order
    retrieved_order = handler.getOrder(order_id)
    print(f"Retrieved order ID: {retrieved_order.id}, Status: {retrieved_order.status}, Total: ${retrieved_order.totalAmount}")
    
    # Get orders by customer
    customer_orders = handler.getOrdersByCustomer("john@example.com")
    print(f"Found {len(customer_orders)} orders for customer")
    
    # Cancel the order
    handler.cancelOrder(order_id)
    cancelled_order = handler.getOrder(order_id)
    print(f"Order {cancelled_order.id} status after cancellation: {cancelled_order.status}")
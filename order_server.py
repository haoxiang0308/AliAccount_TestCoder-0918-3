#!/usr/bin/env python3

import sys
import glob
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

import logging
logging.basicConfig(level=logging.INFO)

class OrderHandler:
    def __init__(self):
        self.orders = {}
        self.next_order_id = 1
        logging.info("OrderHandler initialized")

    def createOrder(self, request):
        logging.info(f"Creating order for {request.customer_name}")
        order = Order(
            id=self.next_order_id,
            customer_name=request.customer_name,
            items=request.items,
            total_amount=request.total_amount,
            status="CREATED"
        )
        self.orders[self.next_order_id] = order
        self.next_order_id += 1
        logging.info(f"Order {order.id} created successfully")
        return order

    def getOrder(self, id):
        logging.info(f"Retrieving order {id}")
        if id in self.orders:
            return self.orders[id]
        else:
            raise OrderException(error_code=404, message=f"Order with id {id} not found")

    def updateOrderStatus(self, id, status):
        logging.info(f"Updating status for order {id} to {status}")
        if id in self.orders:
            self.orders[id].status = status
            return True
        else:
            raise OrderException(error_code=404, message=f"Order with id {id} not found")

    def getOrdersByCustomer(self, customer_name):
        logging.info(f"Retrieving orders for customer {customer_name}")
        customer_orders = [order for order in self.orders.values() if order.customer_name == customer_name]
        return customer_orders

if __name__ == '__main__':
    handler = OrderHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    logging.info("Starting the order service server on port 9090...")
    server.serve()
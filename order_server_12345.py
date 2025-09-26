import sys
import threading
from gen_py.gen import OrderProcessor
from gen_py.gen.ttypes import Order, OrderNotFound
from thrift.transport import TSocket, TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# Простая база данных заказов в памяти
orders_db = {}
next_order_id = 1
db_lock = threading.Lock()

class OrderProcessorHandler:
    def place_order(self, order):
        global next_order_id
        with db_lock:
            order.id = next_order_id
            orders_db[next_order_id] = order
            next_order_id += 1
        print(f"Заказ размещен: {order.id}, {order.customer_name}, {order.product}")
        return True

    def get_order(self, order_id):
        order = orders_db.get(order_id)
        if order is None:
            raise OrderNotFound(f"Заказ с ID {order_id} не найден")
        return order

    def cancel_order(self, order_id):
        with db_lock:
            if order_id in orders_db:
                del orders_db[order_id]
                print(f"Заказ отменен: {order_id}")
                return True
            else:
                raise OrderNotFound(f"Заказ с ID {order_id} не найден")

if __name__ == "__main__":
    handler = OrderProcessorHandler()
    processor = OrderProcessor.Processor(handler)
    transport = TSocket.TServerSocket(host="127.0.0.1", port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    print("Запуск сервера обработки заказов...")
    server.serve()
    print("Сервер остановлен.")
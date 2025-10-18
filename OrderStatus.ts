/**
 * 枚举表示订单的不同状态
 */
export enum OrderStatus {
  PENDING = 'PENDING',           // 待处理
  CONFIRMED = 'CONFIRMED',       // 已确认
  PROCESSING = 'PROCESSING',     // 处理中
  SHIPPED = 'SHIPPED',           // 已发货
  DELIVERED = 'DELIVERED',       // 已送达
  CANCELLED = 'CANCELLED',       // 已取消
  REFUNDED = 'REFUNDED'          // 已退款
}

// 示例用法
const currentOrderStatus: OrderStatus = OrderStatus.PENDING;
console.log(`当前订单状态: ${currentOrderStatus}`);

// 检查订单状态的函数
function checkOrderStatus(status: OrderStatus): string {
  switch (status) {
    case OrderStatus.PENDING:
      return '订单正在等待处理';
    case OrderStatus.CONFIRMED:
      return '订单已确认';
    case OrderStatus.PROCESSING:
      return '订单正在处理中';
    case OrderStatus.SHIPPED:
      return '订单已发货';
    case OrderStatus.DELIVERED:
      return '订单已送达';
    case OrderStatus.CANCELLED:
      return '订单已被取消';
    case OrderStatus.REFUNDED:
      return '订单已退款';
    default:
      return '未知的订单状态';
  }
}

// 导出函数供其他模块使用
export { checkOrderStatus };
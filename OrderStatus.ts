/**
 * 订单状态枚举
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
function getOrderStatusDescription(status: OrderStatus): string {
  switch (status) {
    case OrderStatus.PENDING:
      return '待处理';
    case OrderStatus.CONFIRMED:
      return '已确认';
    case OrderStatus.PROCESSING:
      return '处理中';
    case OrderStatus.SHIPPED:
      return '已发货';
    case OrderStatus.DELIVERED:
      return '已送达';
    case OrderStatus.CANCELLED:
      return '已取消';
    case OrderStatus.REFUNDED:
      return '已退款';
    default:
      return '未知状态';
  }
}

// 导出类型和辅助函数
export { getOrderStatusDescription };
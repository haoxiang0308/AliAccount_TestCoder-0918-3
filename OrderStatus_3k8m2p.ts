/**
 * 枚举表示订单状态
 */
export enum OrderStatus {
  PENDING = 'PENDING',        // 待处理
  CONFIRMED = 'CONFIRMED',    // 已确认
  SHIPPED = 'SHIPPED',       // 已发货
  DELIVERED = 'DELIVERED',    // 已送达
  CANCELLED = 'CANCELLED',    // 已取消
  REFUNDED = 'REFUNDED'      // 已退款
}

// 示例用法
const currentOrderStatus: OrderStatus = OrderStatus.PENDING;
console.log('当前订单状态:', currentOrderStatus);
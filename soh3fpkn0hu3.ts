/**
 * 订单状态枚举
 */
export enum OrderStatus {
  PENDING = 'PENDING',        // 待处理
  CONFIRMED = 'CONFIRMED',    // 已确认
  SHIPPED = 'SHIPPED',        // 已发货
  DELIVERED = 'DELIVERED',    // 已送达
  CANCELLED = 'CANCELLED',    // 已取消
  REFUNDED = 'REFUNDED',      // 已退款
  PROCESSING = 'PROCESSING'   // 处理中
}

// 示例用法
// const orderStatus: OrderStatus = OrderStatus.PENDING;
// console.log(orderStatus); // 输出: PENDING
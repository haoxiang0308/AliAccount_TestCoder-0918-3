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

// 示例使用
console.log('订单状态枚举定义完成');
console.log(OrderStatus.PENDING);  // 输出: PENDING
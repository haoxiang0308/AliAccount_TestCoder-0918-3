/**
 * TypeScript枚举：订单状态
 */
export enum OrderStatus {
  PENDING = 'pending',      // 待处理
  CONFIRMED = 'confirmed',  // 已确认
  SHIPPED = 'shipped',      // 已发货
  DELIVERED = 'delivered',  // 已送达
  CANCELLED = 'cancelled',  // 已取消
  REFUNDED = 'refunded'     // 已退款
}

// 示例用法
const currentStatus: OrderStatus = OrderStatus.PENDING;
console.log(`当前订单状态: ${currentStatus}`);
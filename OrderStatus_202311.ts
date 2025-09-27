/**
 * 枚举：订单状态
 */
export enum OrderStatus {
  PENDING = 'pending',      // 待支付
  PAID = 'paid',            // 已支付
  SHIPPED = 'shipped',      // 已发货
  DELIVERED = 'delivered',  // 已送达
  CANCELLED = 'cancelled',  // 已取消
  REFUNDED = 'refunded'     // 已退款
}

// 示例：如何使用该枚举
const currentStatus: OrderStatus = OrderStatus.PAID;
console.log(`当前订单状态: ${currentStatus}`);
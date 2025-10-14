/**
 * 枚举表示订单的不同状态
 */
export enum OrderStatus {
  PENDING = 'pending',       // 待支付
  PAID = 'paid',             // 已支付
  SHIPPED = 'shipped',       // 已发货
  DELIVERED = 'delivered',   // 已送达
  CANCELLED = 'cancelled',   // 已取消
  REFUNDED = 'refunded'      // 已退款
}

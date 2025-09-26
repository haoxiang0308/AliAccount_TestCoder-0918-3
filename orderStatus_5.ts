/**
 * 枚举表示订单的不同状态
 */
export enum OrderStatus {
  PENDING = 'PENDING',      // 待处理
  CONFIRMED = 'CONFIRMED',  // 已确认
  SHIPPED = 'SHIPPED',     // 已发货
  DELIVERED = 'DELIVERED',  // 已送达
  CANCELLED = 'CANCELLED'   // 已取消
}
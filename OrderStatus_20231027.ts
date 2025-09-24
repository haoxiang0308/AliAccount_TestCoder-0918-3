// 定义订单状态的 TypeScript 枚举
export enum OrderStatus {
  PENDING = 'PENDING',      // 待支付
  PAID = 'PAID',            // 已支付
  SHIPPED = 'SHIPPED',      // 已发货
  DELIVERED = 'DELIVERED',  // 已送达
  CANCELLED = 'CANCELLED'   // 已取消
}
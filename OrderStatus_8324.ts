// 定义订单状态的 TypeScript 枚举
export enum OrderStatus {
  PENDING = 'PENDING',      // 待处理
  CONFIRMED = 'CONFIRMED',  // 已确认
  SHIPPED = 'SHIPPED',     // 已发货
  DELIVERED = 'DELIVERED',  // 已送达
  CANCELLED = 'CANCELLED'   // 已取消
}

// 示例：如何使用该枚举
const currentOrderStatus: OrderStatus = OrderStatus.PENDING;
console.log(`当前订单状态是: ${currentOrderStatus}`);
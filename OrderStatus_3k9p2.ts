/**
 * 枚举表示订单的不同状态。
 */
export enum OrderStatus {
  /**
   * 订单已创建，等待处理。
   */
  PENDING = 'PENDING',

  /**
   * 订单已确认，正在准备中。
   */
  CONFIRMED = 'CONFIRMED',

  /**
   * 订单已发货。
   */
  SHIPPED = 'SHIPPED',

  /**
   * 订单已完成。
   */
  DELIVERED = 'DELIVERED',

  /**
   * 订单已取消。
   */
  CANCELLED = 'CANCELLED',
}
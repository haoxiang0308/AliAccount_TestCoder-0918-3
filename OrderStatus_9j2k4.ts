/**
 * 枚举：订单状态
 */
export enum OrderStatus {
  /**
   * 待付款
   */
  PENDING_PAYMENT = 'PENDING_PAYMENT',

  /**
   * 待发货
   */
  PENDING_SHIPMENT = 'PENDING_SHIPMENT',

  /**
   * 运输中
   */
  IN_TRANSIT = 'IN_TRANSIT',

  /**
   * 已完成
   */
  COMPLETED = 'COMPLETED',

  /**
   * 已取消
   */
  CANCELLED = 'CANCELLED',
}
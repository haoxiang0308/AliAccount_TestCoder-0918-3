/**
 * 订单状态枚举
 */
export enum OrderStatus {
  /**
   * 待支付
   */
  PENDING_PAYMENT = 'PENDING_PAYMENT',
  
  /**
   * 已支付
   */
  PAID = 'PAID',
  
  /**
   * 已发货
   */
  SHIPPED = 'SHIPPED',
  
  /**
   * 已完成
   */
  COMPLETED = 'COMPLETED',
  
  /**
   * 已取消
   */
  CANCELLED = 'CANCELLED',
  
  /**
   * 退款中
   */
  REFUNDING = 'REFUNDING',
  
  /**
   * 已退款
   */
  REFUNDED = 'REFUNDED'
}
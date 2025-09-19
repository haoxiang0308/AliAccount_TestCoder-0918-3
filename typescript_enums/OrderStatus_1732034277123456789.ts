// File: OrderStatus.ts
// This file defines the enumeration for order statuses in a TypeScript application.

/**
 * Represents the possible states of an order.
 * @enum {number}
 */
enum OrderStatus {
    /** The order has been created but not yet processed. */
    Pending = 0,
    /** The order is being prepared or processed. */
    Processing = 1,
    /** The order has been shipped. */
    Shipped = 2,
    /** The order has been delivered to the customer. */
    Delivered = 3,
    /** The order has been cancelled. */
    Cancelled = 4,
    /** The order processing has failed. */
    Failed = 5
}

export default OrderStatus;
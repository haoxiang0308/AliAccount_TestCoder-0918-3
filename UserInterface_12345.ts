/**
 * Interface representing a User.
 */
interface User {
  /**
   * Unique identifier for the user.
   */
  id: number;

  /**
   * Name of the user.
   */
  name: string;

  /**
   * Email address of the user.
   */
  email: string;
}

// Example usage:
// const user: User = {
//   id: 1,
//   name: "John Doe",
//   email: "john.doe@example.com"
// };
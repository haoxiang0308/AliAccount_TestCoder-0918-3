// Define a generic API response type
type ApiResponse<T = any> = {
  success: boolean;
  data?: T;
  error?: {
    message: string;
    code?: string;
    details?: any;
  };
  message?: string;
  statusCode: number;
  timestamp: string;
};

// Example of a specific API response type
type UserApiResponse = ApiResponse<{
  id: number;
  name: string;
  email: string;
  createdAt: string;
}>;

// Example of a list API response type
type ListApiResponse<T> = ApiResponse<{
  items: T[];
  total: number;
  page: number;
  limit: number;
}>;

export type { ApiResponse, UserApiResponse, ListApiResponse };
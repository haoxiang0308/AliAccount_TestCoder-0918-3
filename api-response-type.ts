// Definición de un tipo TypeScript para una respuesta de API
type ApiResponse<T> = {
  success: boolean;
  data?: T;
  error?: {
    code: string;
    message: string;
  };
  timestamp: string;
};

export type { ApiResponse };
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, BehaviorSubject, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

export interface User {
  id: string;
  username: string;
  email: string;
}

export interface LoginCredentials {
  username: string;
  password: string;
}

export interface AuthResponse {
  token: string;
  user: User;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'api/auth'; // URL del servidor de autenticación
  private authSubject = new BehaviorSubject<User | null>(null);
  
  constructor(private http: HttpClient) {}

  /**
   * Inicia sesión con las credenciales proporcionadas
   */
  login(credentials: LoginCredentials): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials)
      .pipe(
        map(response => {
          if (response.token && response.user) {
            localStorage.setItem('auth_token', response.token);
            localStorage.setItem('user', JSON.stringify(response.user));
            this.authSubject.next(response.user);
          }
          return response;
        }),
        catchError(this.handleError)
      );
  }

  /**
   * Cierra la sesión del usuario actual
   */
  logout(): void {
    localStorage.removeItem('auth_token');
    localStorage.removeItem('user');
    this.authSubject.next(null);
  }

  /**
   * Registra un nuevo usuario
   */
  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData)
      .pipe(
        catchError(this.handleError)
      );
  }

  /**
   * Obtiene el usuario actual desde el almacenamiento local
   */
  getCurrentUser(): User | null {
    const userStr = localStorage.getItem('user');
    return userStr ? JSON.parse(userStr) : null;
  }

  /**
   * Verifica si el usuario está autenticado
   */
  isAuthenticated(): boolean {
    return !!this.getCurrentToken();
  }

  /**
   * Obtiene el token de autenticación
   */
  getCurrentToken(): string | null {
    return localStorage.getItem('auth_token');
  }

  /**
   * Obtiene los encabezados HTTP con el token de autorización
   */
  getAuthHeaders(): HttpHeaders {
    const token = this.getCurrentToken();
    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
  }

  /**
   * Suscribirse a los cambios en el estado de autenticación
   */
  getAuthStatusListener(): Observable<User | null> {
    return this.authSubject.asObservable();
  }

  /**
   * Manojo de errores
   */
  private handleError(error: any) {
    console.error('Error de autenticación:', error);
    return throwError(() => new Error('Ocurrió un error durante la operación'));
  }
}
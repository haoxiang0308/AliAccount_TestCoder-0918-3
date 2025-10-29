import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl?: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = '';
  private headers = new HttpHeaders({
    'Content-Type': 'application/json'
  });

  constructor(private http: HttpClient) {}

  /**
   * Set configuration for the API service
   */
  configure(config: ApiServiceConfig) {
    if (config.baseUrl) {
      this.baseUrl = config.baseUrl;
    }
    return this;
  }

  /**
   * Set custom headers for requests
   */
  setHeaders(headers: { [key: string]: string }): ApiService {
    let newHeaders = this.headers;
    Object.keys(headers).forEach(key => {
      newHeaders = newHeaders.set(key, headers[key]);
    });
    this.headers = newHeaders;
    return this;
  }

  /**
   * GET request
   */
  get<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.get<T>(url, { headers: this.headers });
  }

  /**
   * POST request
   */
  post<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.post<T>(url, data, { headers: this.headers });
  }

  /**
   * PUT request
   */
  put<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.put<T>(url, data, { headers: this.headers });
  }

  /**
   * DELETE request
   */
  delete<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.delete<T>(url, { headers: this.headers });
  }

  /**
   * PATCH request
   */
  patch<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.patch<T>(url, data, { headers: this.headers });
  }
}
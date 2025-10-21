import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * GET request
   */
  get<T>(endpoint: string, options?: { params?: HttpParams | { [param: string]: string | string[] } }): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, options);
  }

  /**
   * POST request
   */
  post<T>(endpoint: string, data: any, options?: { headers?: HttpHeaders }): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data, options);
  }

  /**
   * PUT request
   */
  put<T>(endpoint: string, data: any, options?: { headers?: HttpHeaders }): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data, options);
  }

  /**
   * DELETE request
   */
  delete<T>(endpoint: string, options?: { headers?: HttpHeaders }): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url, options);
  }

  /**
   * PATCH request
   */
  patch<T>(endpoint: string, data: any, options?: { headers?: HttpHeaders }): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.patch<T>(url, data, options);
  }

  /**
   * Configure base URL
   */
  configure(config: ApiServiceConfig) {
    this.baseUrl = config.baseUrl;
  }

  /**
   * Set base URL directly
   */
  setBaseUrl(url: string) {
    this.baseUrl = url;
  }
}
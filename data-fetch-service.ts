import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * GET request
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * POST request
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * PUT request
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * DELETE request
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * Configure base URL
   */
  configure(config: DataServiceConfig) {
    this.baseUrl = config.baseUrl;
  }
}
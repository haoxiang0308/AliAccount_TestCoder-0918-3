import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * Set the base URL for API requests
   */
  setConfig(config: DataServiceConfig) {
    this.baseUrl = config.baseUrl;
  }

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
  updateData<T>(endpoint: string, data: any): Observable<T> {
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
   * GET request with custom headers
   */
  getDataWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { headers });
  }
}
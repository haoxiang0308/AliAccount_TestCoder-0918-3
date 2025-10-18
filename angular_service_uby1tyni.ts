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

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint The API endpoint to call
   * @returns Observable of the response
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Generic POST request
   * @param endpoint The API endpoint to call
   * @param data The data to send
   * @returns Observable of the response
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * Generic PUT request
   * @param endpoint The API endpoint to call
   * @param data The data to send
   * @returns Observable of the response
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * Generic DELETE request
   * @param endpoint The API endpoint to call
   * @returns Observable of the response
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * GET request with custom headers
   * @param endpoint The API endpoint to call
   * @param headers Optional custom headers
   * @returns Observable of the response
   */
  getDataWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { headers });
  }
}
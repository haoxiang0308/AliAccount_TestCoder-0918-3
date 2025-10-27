import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataResponse {
  // Define your data structure here based on your API response
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://api.example.com'; // Replace with your actual API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request method
   * @param endpoint The API endpoint to call
   * @returns Observable of the response data
   */
  getData<T = DataResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Generic POST request method
   * @param endpoint The API endpoint to call
   * @param data The data to send in the request body
   * @returns Observable of the response data
   */
  postData<T = DataResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  /**
   * Generic PUT request method
   * @param endpoint The API endpoint to call
   * @param data The data to send in the request body
   * @returns Observable of the response data
   */
  putData<T = DataResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  /**
   * Generic DELETE request method
   * @param endpoint The API endpoint to call
   * @returns Observable of the response data
   */
  deleteData<T = DataResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * Method to set a custom base URL
   * @param url The new base URL for API requests
   */
  setBaseUrl(url: string): void {
    this.baseUrl = url;
  }
}
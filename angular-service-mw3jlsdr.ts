import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define the structure of your API response here
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  /**
   * GET request
   */
  getData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * POST request
   */
  postData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * PUT request
   */
  putData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * DELETE request
   */
  deleteData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * GET request with custom headers
   */
  getDataWithHeaders<T = ApiResponse>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { headers });
  }
}
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceInterface {
  getData<T>(url: string): Observable<T>;
  postData<T>(url: string, data: any): Observable<T>;
  putData<T>(url: string, data: any): Observable<T>;
  deleteData<T>(url: string): Observable<T>;
}

@Injectable({
  providedIn: 'root'
})
export class DataService implements DataServiceInterface {
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient) { }

  /**
   * GET request method
   * @param url The URL to fetch data from
   * @returns Observable with the response data
   */
  getData<T>(url: string): Observable<T> {
    return this.http.get<T>(url, this.httpOptions);
  }

  /**
   * POST request method
   * @param url The URL to send data to
   * @param data The data to send
   * @returns Observable with the response data
   */
  postData<T>(url: string, data: any): Observable<T> {
    return this.http.post<T>(url, data, this.httpOptions);
  }

  /**
   * PUT request method
   * @param url The URL to update data at
   * @param data The data to update
   * @returns Observable with the response data
   */
  putData<T>(url: string, data: any): Observable<T> {
    return this.http.put<T>(url, data, this.httpOptions);
  }

  /**
   * DELETE request method
   * @param url The URL to delete data from
   * @returns Observable with the response data
   */
  deleteData<T>(url: string): Observable<T> {
    return this.http.delete<T>(url, this.httpOptions);
  }
}
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {
  private baseUrl: string = 'https://jsonplaceholder.typicode.com'; // Example API

  constructor(private http: HttpClient) { }

  // GET request
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

  // POST request
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    return this.http.post<T>(url, data, httpOptions)
      .pipe(
        catchError(this.handleError)
      );
  }

  // PUT request
  updateData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    return this.http.put<T>(url, data, httpOptions)
      .pipe(
        catchError(this.handleError)
      );
  }

  // DELETE request
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Error handling
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Unknown error!';
    if (error.error instanceof ErrorEvent) {
      // Client-side errors
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side errors
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  }
}
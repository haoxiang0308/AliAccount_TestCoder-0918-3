import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Define a simple interface for our data
export interface DataItem {
  id: number;
  name: string;
  description?: string;
}

@Injectable({
  providedIn: 'root'
})
export class H8OE5gRjGUService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API

  constructor(private http: HttpClient) { }

  // GET request to fetch data
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  // GET request to fetch a single item by ID
  getDataItem(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url);
  }

  // POST request to create new data
  createDataItem(item: DataItem): Observable<DataItem> {
    return this.http.post<DataItem>(this.apiUrl, item);
  }

  // PUT request to update existing data
  updateDataItem(id: number, item: DataItem): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<DataItem>(url, item);
  }

  // DELETE request to remove data
  deleteDataItem(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete(url);
  }
}
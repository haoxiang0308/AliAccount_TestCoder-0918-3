import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Define an interface for our data
export interface DataItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetcherService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API

  constructor(private http: HttpClient) { }

  // Fetch all data items
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  // Fetch a single data item by ID
  getDataById(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url);
  }

  // Create a new data item
  createData(item: DataItem): Observable<DataItem> {
    return this.http.post<DataItem>(this.apiUrl, item);
  }

  // Update an existing data item
  updateData(id: number, item: DataItem): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<DataItem>(url, item);
  }

  // Delete a data item
  deleteData(id: number): Observable<void> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(url);
  }
}
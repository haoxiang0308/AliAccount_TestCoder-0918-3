// Простой HTTP-сервис для Angular
// Создан вручную, так как автоматическая генерация не удалась

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface UserData {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  getData(): Observable<UserData[]> {
    return this.http.get<UserData[]>(this.apiUrl);
  }
}
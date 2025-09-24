import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Определение интерфейса для данных пользователя (пример)
export interface UserData {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root' // Сервис будет предоставлен на уровне корневого инжектора
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  // Метод для получения данных
  getData(): Observable<UserData[]> {
    return this.http.get<UserData[]>(this.apiUrl);
  }

  // Метод для получения одного пользователя по ID
  getUserById(id: number): Observable<UserData> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<UserData>(url);
  }

  // Метод для отправки данных (пример POST-запроса)
  postData(userData: Partial<UserData>): Observable<Partial<UserData>> {
    return this.http.post<Partial<UserData>>(this.apiUrl, userData);
  }
}
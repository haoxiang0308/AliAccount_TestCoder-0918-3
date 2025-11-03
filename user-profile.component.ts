import { Component, Input } from '@angular/core';

interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address?: string;
  avatar?: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div class="default-avatar" *ngIf="!user.avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="user-id">ID: {{ user.id }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ user.email }}</span>
        </div>
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ user.phone }}</span>
        </div>
        <div class="detail-item" *ngIf="user.address">
          <label>Address:</label>
          <span>{{ user.address }}</span>
        </div>
        <div class="detail-item bio" *ngIf="user.bio">
          <label>Bio:</label>
          <span>{{ user.bio }}</span>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }
    
    .default-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .user-id {
      color: #666;
      font-size: 14px;
      margin: 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 12px;
    }
    
    .detail-item label {
      font-weight: bold;
      width: 100px;
      color: #555;
    }
    
    .detail-item.bio label {
      vertical-align: top;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User = {
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    bio: 'No bio available'
  };
}
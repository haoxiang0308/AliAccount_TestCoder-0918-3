import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  address?: string;
  bio?: string;
  avatar?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="profile-avatar">
        <div *ngIf="!user.avatar" class="profile-avatar-placeholder">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="profile-name">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="profile-email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item" *ngIf="user.phone">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong> {{ user.address }}
        </div>
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong> {{ user.bio }}
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    
    .profile-avatar-placeholder {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 20px;
    }
    
    .profile-name h1 {
      margin: 0;
      margin-bottom: 5px;
    }
    
    .profile-email {
      color: #666;
      margin: 0;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    address: '',
    bio: '',
    avatar: ''
  };
}
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
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="email">{{ user.email }}</p>
          <p class="phone" *ngIf="user.phone">{{ user.phone }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <span>{{ user.address }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong>
          <p>{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
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
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .user-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .email, .phone {
      margin: 5px 0;
      color: #666;
    }
    
    .profile-details .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-details .detail-item:last-child {
      border-bottom: none;
    }
    
    .profile-details strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
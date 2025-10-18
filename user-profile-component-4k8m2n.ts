import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  avatar: string;
  bio: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img [src]="user.avatar" [alt]="user.firstName + ' ' + user.lastName" class="avatar">
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="email">{{ user.email }}</p>
          <p class="join-date">Member since: {{ user.joinDate | date:'mediumDate' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Address:</strong> {{ user.address }}
        </div>
        <div class="detail-item">
          <strong>Bio:</strong> {{ user.bio }}
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
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .user-info h1 {
      margin: 0 0 5px 0;
      font-size: 24px;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .join-date {
      color: #888;
      font-size: 14px;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding: 8px 0;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
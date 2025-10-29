import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate?: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.name"
          class="avatar">
        <div class="default-avatar" *ngIf="!user.avatar">{{ user.name.charAt(0) }}</div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p class="location" *ngIf="user.location">{{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details" *ngIf="user.bio || user.joinDate">
        <p class="bio" *ngIf="user.bio">{{ user.bio }}</p>
        <p class="join-date" *ngIf="user.joinDate">Member since: {{ user.joinDate | date:'longDate' }}</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
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
      font-size: 32px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .location {
      color: #888;
      font-style: italic;
      margin: 5px 0;
    }
    
    .profile-details {
      border-top: 1px solid #eee;
      padding-top: 15px;
    }
    
    .bio {
      color: #555;
      line-height: 1.5;
    }
    
    .join-date {
      color: #999;
      font-size: 0.9em;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    avatar: '',
    bio: '',
    joinDate: new Date(),
    location: ''
  };
}
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
          class="avatar"
        >
        <div class="default-avatar" *ngIf="!user.avatar">
          {{ user.name.charAt(0) }}
        </div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p class="location" *ngIf="user.location">📍 {{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="bio" *ngIf="user.bio">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="join-date" *ngIf="user.joinDate">
          <h3>Member since</h3>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
      margin: 0 0 5px 0;
    }
    
    .location {
      color: #888;
      margin: 0;
    }
    
    .profile-details h3 {
      color: #555;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
      margin-top: 15px;
      margin-bottom: 10px;
    }
    
    .bio p {
      color: #444;
      line-height: 1.5;
    }
    
    .join-date p {
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
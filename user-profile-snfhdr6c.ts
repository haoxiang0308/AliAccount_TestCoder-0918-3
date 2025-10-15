import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  bio?: string;
  avatar?: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar for ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <h3>@{{ user.username }}</h3>
          <p class="email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="bio" *ngIf="user.bio">
          <h4>About</h4>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="join-date">
          <h4>Member since</h4>
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
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
      margin-right: 15px;
      object-fit: cover;
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
      font-size: 24px;
    }
    
    .user-info h3 {
      margin: 0 0 5px 0;
      color: #666;
      font-size: 16px;
    }
    
    .email {
      color: #888;
      margin: 0;
    }
    
    .profile-details h4 {
      margin: 15px 0 5px 0;
      color: #333;
      font-size: 14px;
      text-transform: uppercase;
    }
    
    .bio p {
      margin: 0;
      color: #555;
      line-height: 1.5;
    }
    
    .join-date p {
      margin: 0;
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
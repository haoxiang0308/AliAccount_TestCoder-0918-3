import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  avatar?: string;
  bio?: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Profile of ' + user.firstName + ' ' + user.lastName"
          class="profile-avatar"
        >
        <div *ngIf="!user.avatar" class="profile-avatar-placeholder">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="profile-basic-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="profile-email">{{ user.email }}</p>
          <p class="profile-phone">{{ user.phone }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-section">
          <h2>About</h2>
          <p *ngIf="user.bio">{{ user.bio }}</p>
          <p *ngIf="!user.bio">No bio available.</p>
        </div>
        
        <div class="detail-section">
          <h2>Member Since</h2>
          <p>{{ user.joinDate | date:'longDate' }}</p>
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .profile-avatar-placeholder {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 32px;
      font-weight: bold;
      margin-right: 20px;
    }
    
    .profile-basic-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .profile-email, .profile-phone {
      margin: 5px 0;
      color: #666;
    }
    
    .profile-details .detail-section {
      margin-bottom: 20px;
    }
    
    .profile-details h2 {
      margin-bottom: 10px;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
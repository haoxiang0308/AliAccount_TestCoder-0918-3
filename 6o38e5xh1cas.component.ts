import { Component, Input } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-card">
        <div class="profile-header">
          <img 
            *ngIf="user.avatar" 
            [src]="user.avatar" 
            [alt]="user.name" 
            class="profile-avatar">
          <div *ngIf="!user.avatar" class="default-avatar">
            {{ user.name.charAt(0) }}
          </div>
          <h2 class="profile-name">{{ user.name }}</h2>
        </div>
        
        <div class="profile-details">
          <div class="detail-item">
            <strong>Email:</strong>
            <span>{{ user.email }}</span>
          </div>
          
          <div class="detail-item" *ngIf="user.location">
            <strong>Location:</strong>
            <span>{{ user.location }}</span>
          </div>
          
          <div class="detail-item">
            <strong>Member Since:</strong>
            <span>{{ user.joinDate | date:'mediumDate' }}</span>
          </div>
          
          <div class="detail-item bio" *ngIf="user.bio">
            <strong>Bio:</strong>
            <p>{{ user.bio }}</p>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      display: flex;
      justify-content: center;
      padding: 20px;
    }
    
    .profile-card {
      background: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      max-width: 400px;
      width: 100%;
      overflow: hidden;
    }
    
    .profile-header {
      text-align: center;
      padding: 30px 20px 20px;
      background: #f5f7fa;
      border-bottom: 1px solid #eaeaea;
    }
    
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 4px solid white;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: #4a90e2;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      font-weight: bold;
      margin: 0 auto 15px;
      border: 4px solid white;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-name {
      margin: 10px 0 0;
      color: #333;
      font-size: 24px;
    }
    
    .profile-details {
      padding: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
      margin-bottom: 0;
      padding-bottom: 0;
    }
    
    .detail-item strong {
      display: block;
      color: #555;
      margin-bottom: 5px;
    }
    
    .detail-item p {
      margin: 0;
      color: #666;
      line-height: 1.5;
    }
    
    .bio strong {
      margin-bottom: 10px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
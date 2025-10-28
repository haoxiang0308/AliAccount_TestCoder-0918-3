import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address: string;
  avatar: string;
  bio: string;
  joinDate: Date;
  isOnline: boolean;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-card">
        <div class="profile-header">
          <img [src]="userProfile.avatar" alt="Profile Avatar" class="avatar">
          <div class="status-indicator" [class.online]="userProfile.isOnline"></div>
        </div>
        
        <div class="profile-body">
          <h2>{{ userProfile.name }}</h2>
          <p class="bio">{{ userProfile.bio }}</p>
          
          <div class="profile-details">
            <div class="detail-item">
              <strong>Email:</strong> {{ userProfile.email }}
            </div>
            <div class="detail-item">
              <strong>Phone:</strong> {{ userProfile.phone }}
            </div>
            <div class="detail-item">
              <strong>Address:</strong> {{ userProfile.address }}
            </div>
            <div class="detail-item">
              <strong>Member since:</strong> {{ userProfile.joinDate | date:'mediumDate' }}
            </div>
            <div class="detail-item">
              <strong>Status:</strong> 
              <span [class.online-status]="userProfile.isOnline" [class.offline-status]="!userProfile.isOnline">
                {{ userProfile.isOnline ? 'Online' : 'Offline' }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      min-height: 100vh;
      background-color: #f5f5f5;
    }
    
    .profile-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 16px rgba(0,0,0,0.1);
      max-width: 500px;
      width: 100%;
      overflow: hidden;
      position: relative;
    }
    
    .profile-header {
      position: relative;
      text-align: center;
      padding: 30px 20px 20px;
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      color: white;
    }
    
    .avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 4px solid white;
      object-fit: cover;
    }
    
    .status-indicator {
      position: absolute;
      bottom: 20px;
      right: calc(50% - 30px);
      width: 20px;
      height: 20px;
      border-radius: 50%;
      border: 3px solid white;
    }
    
    .status-indicator.online {
      background-color: #4CAF50;
    }
    
    .profile-body {
      padding: 30px;
    }
    
    .profile-body h2 {
      margin: 0 0 10px;
      color: #333;
      font-size: 24px;
    }
    
    .bio {
      color: #666;
      font-style: italic;
      margin-bottom: 25px;
      line-height: 1.5;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    
    .detail-item {
      display: flex;
      justify-content: space-between;
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .online-status {
      color: #4CAF50;
      font-weight: bold;
    }
    
    .offline-status {
      color: #f44336;
      font-weight: bold;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'Alex Johnson',
    email: 'alex.johnson@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY 10001',
    avatar: 'https://via.placeholder.com/120x120/4285F4/FFFFFF?text=AJ',
    bio: 'Software developer passionate about creating beautiful and functional user experiences. Love working with Angular, TypeScript, and modern web technologies.',
    joinDate: new Date('2022-03-15'),
    isOnline: true
  };

  constructor() { }

  ngOnInit(): void {
  }
}
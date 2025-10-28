import { Component, OnInit } from '@angular/core';

interface UserProfile {
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
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="userProfile.avatar" alt="User Avatar" class="avatar" />
        <div class="user-info">
          <h1>{{ userProfile.firstName }} {{ userProfile.lastName }}</h1>
          <p class="email">{{ userProfile.email }}</p>
          <p class="join-date">Member since: {{ userProfile.joinDate | date:'longDate' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ userProfile.phone }}</span>
        </div>
        <div class="detail-item">
          <label>Address:</label>
          <span>{{ userProfile.address }}</span>
        </div>
        <div class="detail-item">
          <label>Bio:</label>
          <p class="bio">{{ userProfile.bio }}</p>
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
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 20px;
    }
    
    .user-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .join-date {
      color: #888;
      font-size: 0.9em;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      color: #555;
      display: block;
      margin-bottom: 5px;
    }
    
    .detail-item span {
      color: #333;
    }
    
    .bio {
      color: #555;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main St, New York, NY 10001',
    avatar: 'https://via.placeholder.com/100',
    bio: 'Software developer with 5 years of experience in web development and a passion for creating user-friendly applications.',
    joinDate: new Date('2022-01-15')
  };

  constructor() { }

  ngOnInit(): void {
  }
}
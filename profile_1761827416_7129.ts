import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address: string;
  avatar: string;
  bio: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-card">
        <div class="profile-header">
          <img [src]="userProfile.avatar" alt="User Avatar" class="avatar">
          <h1>{{ userProfile.name }}</h1>
        </div>
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
          <div class="detail-item bio">
            <strong>About:</strong>
            <p>{{ userProfile.bio }}</p>
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
      background: white;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      max-width: 500px;
      width: 100%;
      overflow: hidden;
    }
    
    .profile-header {
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      color: white;
      text-align: center;
      padding: 30px 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 4px solid white;
      margin-bottom: 15px;
    }
    
    .profile-header h1 {
      margin: 10px 0 0 0;
      font-size: 1.8em;
    }
    
    .profile-details {
      padding: 25px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
    
    .bio p {
      margin-top: 8px;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY',
    avatar: 'https://via.placeholder.com/150',
    bio: 'Software developer with a passion for creating beautiful and functional user interfaces. Experienced in Angular, TypeScript, and modern web technologies.'
  };

  constructor() { }

  ngOnInit(): void {
  }
}
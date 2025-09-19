import { Component, Input } from '@angular/core';

export interface UserProfile {
  name: string;
  email: string;
  phone: string;
  address: string;
  avatarUrl: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img [src]="user.avatarUrl" alt="User Avatar" class="avatar" *ngIf="user.avatarUrl">
        <h2>{{ user.name }}</h2>
      </div>
      <div class="profile-details">
        <div class="detail-row">
          <span class="label">Email:</span>
          <span class="value">{{ user.email }}</span>
        </div>
        <div class="detail-row">
          <span class="label">Phone:</span>
          <span class="value">{{ user.phone }}</span>
        </div>
        <div class="detail-row">
          <span class="label">Address:</span>
          <span class="value">{{ user.address }}</span>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 10px;
    }
    
    .profile-details .detail-row {
      display: flex;
      margin-bottom: 10px;
    }
    
    .label {
      font-weight: bold;
      width: 80px;
      color: #555;
    }
    
    .value {
      flex: 1;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main St, City, State 12345',
    avatarUrl: 'https://via.placeholder.com/100'
  };
}
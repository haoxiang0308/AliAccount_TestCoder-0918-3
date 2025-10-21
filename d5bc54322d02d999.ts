import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <h2>{{ user?.name || 'User Profile' }}</h2>
        <p class="username">@{{ user?.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Name:</strong> {{ user?.name }}
        </div>
        <div class="detail-item">
          <strong>Email:</strong> <a href="mailto:{{ user?.email }}">{{ user?.email }}</a>
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user?.phone }}
        </div>
        <div class="detail-item">
          <strong>Website:</strong> <a href="http://{{ user?.website }}" target="_blank">{{ user?.website }}</a>
        </div>
        <div class="detail-item" *ngIf="user?.address">
          <strong>Address:</strong>
          <div>{{ user?.address.street }}, {{ user?.address.suite }}</div>
          <div>{{ user?.address.city }}, {{ user?.address.zipcode }}</div>
        </div>
        <div class="detail-item" *ngIf="user?.company">
          <strong>Company:</strong>
          <div>{{ user?.company.name }}</div>
          <div>{{ user?.company.catchPhrase }}</div>
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
    
    .profile-header h2 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      font-style: italic;
      margin: 0 0 20px 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .detail-item a {
      color: #007bff;
      text-decoration: none;
    }
    
    .detail-item a:hover {
      text-decoration: underline;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}

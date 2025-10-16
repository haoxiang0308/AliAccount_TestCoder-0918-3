import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
    geo: {
      lat: string;
      lng: string;
    };
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile" *ngIf="user">
      <div class="profile-header">
        <h2>{{ user.name }}'s Profile</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ user.email }}</span>
        </div>
        
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ user.phone }}</span>
        </div>
        
        <div class="detail-item">
          <label>Website:</label>
          <span>{{ user.website }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.address">
          <label>Address:</label>
          <div class="address-details">
            <p>{{ user.address.street }}, {{ user.address.suite }}</p>
            <p>{{ user.address.city }}, {{ user.address.zipcode }}</p>
            <p>Coordinates: ({{ user.address.geo.lat }}, {{ user.address.geo.lng }})</p>
          </div>
        </div>
        
        <div class="detail-item" *ngIf="user.company">
          <label>Company:</label>
          <div class="company-details">
            <p>{{ user.company.name }}</p>
            <p>Catchphrase: {{ user.company.catchPhrase }}</p>
            <p>BS: {{ user.company.bs }}</p>
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!user" class="no-user">
      <p>No user data available</p>
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
      background-color: #f9f9f9;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-header h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding: 10px;
      background-color: white;
      border-radius: 4px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }
    
    .detail-item label {
      font-weight: bold;
      display: inline-block;
      width: 100px;
      color: #555;
    }
    
    .detail-item span {
      color: #333;
    }
    
    .address-details p,
    .company-details p {
      margin: 5px 0;
    }
    
    .no-user {
      text-align: center;
      padding: 20px;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}
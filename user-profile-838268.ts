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
      <h2>User Profile</h2>
      <div class="profile-card">
        <h3>{{ user.name }}</h3>
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Phone:</strong> {{ user.phone }}</p>
        <p><strong>Website:</strong> {{ user.website }}</p>
        
        <div class="address" *ngIf="user.address">
          <h4>Address</h4>
          <p>{{ user.address.street }}, {{ user.address.suite }}</p>
          <p>{{ user.address.city }}, {{ user.address.zipcode }}</p>
        </div>
        
        <div class="company" *ngIf="user.company">
          <h4>Company</h4>
          <p>{{ user.company.name }}</p>
          <p><em>{{ user.company.catchPhrase }}</em></p>
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
    
    .profile-card h3 {
      color: #333;
      margin-bottom: 10px;
    }
    
    .profile-card p {
      margin: 5px 0;
      color: #666;
    }
    
    .address, .company {
      margin-top: 15px;
      padding-top: 10px;
      border-top: 1px solid #eee;
    }
    
    h4 {
      color: #555;
      margin-bottom: 5px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}
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
    <div class="user-profile" *ngIf="user">
      <h2>User Profile</h2>
      <div class="profile-info">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Phone:</strong> {{ user.phone }}</p>
        <p><strong>Website:</strong> {{ user.website }}</p>
        
        <div *ngIf="user.address" class="address-section">
          <h3>Address</h3>
          <p><strong>Street:</strong> {{ user.address.street }}</p>
          <p><strong>Suite:</strong> {{ user.address.suite }}</p>
          <p><strong>City:</strong> {{ user.address.city }}</p>
          <p><strong>Zipcode:</strong> {{ user.address.zipcode }}</p>
        </div>
        
        <div *ngIf="user.company" class="company-section">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user.company.name }}</p>
          <p><strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}</p>
          <p><strong>BS:</strong> {{ user.company.bs }}</p>
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
    }
    
    .profile-info p {
      margin: 10px 0;
      line-height: 1.5;
    }
    
    .profile-info h3 {
      margin-top: 20px;
      margin-bottom: 10px;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .no-user {
      text-align: center;
      padding: 20px;
      color: #666;
    }
    
    strong {
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}
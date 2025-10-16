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
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container" *ngIf="user">
      <div class="profile-header">
        <h2>{{ user.name }}'s Profile</h2>
      </div>
      <div class="profile-details">
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
        </div>
      </div>
    </div>
    <div *ngIf="!user" class="no-user">
      <p>No user data available</p>
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
      background-color: #f9f9f9;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-header h2 {
      margin: 0;
      color: #333;
    }
    
    .profile-details p {
      margin: 8px 0;
      padding: 5px 0;
      border-bottom: 1px solid #eee;
    }
    
    .profile-details p:last-child {
      border-bottom: none;
    }
    
    .profile-details strong {
      display: inline-block;
      width: 100px;
      color: #555;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .address-section h3, .company-section h3 {
      margin-top: 0;
      color: #444;
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
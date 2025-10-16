import { Component, Input } from '@angular/core';

export interface UserProfile {
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
    <div class="user-profile">
      <div class="profile-header">
        <h2>User Profile</h2>
      </div>
      <div class="profile-content" *ngIf="user; else noUser">
        <div class="profile-section">
          <h3>Personal Information</h3>
          <p><strong>Name:</strong> {{ user.name }}</p>
          <p><strong>Username:</strong> {{ user.username }}</p>
          <p><strong>Email:</strong> {{ user.email }}</p>
          <p><strong>Phone:</strong> {{ user.phone }}</p>
          <p><strong>Website:</strong> {{ user.website }}</p>
        </div>
        
        <div class="profile-section" *ngIf="user.address">
          <h3>Address</h3>
          <p><strong>Street:</strong> {{ user.address.street }}</p>
          <p><strong>Suite:</strong> {{ user.address.suite }}</p>
          <p><strong>City:</strong> {{ user.address.city }}</p>
          <p><strong>Zipcode:</strong> {{ user.address.zipcode }}</p>
        </div>
        
        <div class="profile-section" *ngIf="user.company">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user.company.name }}</p>
        </div>
      </div>
      <ng-template #noUser>
        <p>No user data available.</p>
      </ng-template>
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
      margin-top: 0;
      color: #333;
    }
    
    .profile-section {
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-section:last-child {
      border-bottom: none;
    }
    
    .profile-section h3 {
      margin-top: 0;
      color: #555;
    }
    
    .profile-section p {
      margin: 8px 0;
    }
    
    strong {
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile | null = null;
}
import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  website: string;
  address?: {
    street: string;
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
        <h2>{{ userProfile?.name || 'User Profile' }}</h2>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>ID:</label>
          <span>{{ userProfile?.id }}</span>
        </div>
        
        <div class="detail-item">
          <label>Name:</label>
          <span>{{ userProfile?.name }}</span>
        </div>
        
        <div class="detail-item">
          <label>Email:</label>
          <span><a href="mailto:{{ userProfile?.email }}">{{ userProfile?.email }}</a></span>
        </div>
        
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ userProfile?.phone }}</span>
        </div>
        
        <div class="detail-item">
          <label>Website:</label>
          <span><a href="http://{{ userProfile?.website }}" target="_blank">{{ userProfile?.website }}</a></span>
        </div>
        
        <div class="detail-item" *ngIf="userProfile?.address">
          <label>Address:</label>
          <div class="address-details">
            <p>{{ userProfile?.address?.street }}</p>
            <p>{{ userProfile?.address?.city }}, {{ userProfile?.address?.zipcode }}</p>
          </div>
        </div>
        
        <div class="detail-item" *ngIf="userProfile?.company">
          <label>Company:</label>
          <div class="company-details">
            <p>{{ userProfile?.company?.name }}</p>
            <p>Catch Phrase: {{ userProfile?.company?.catchPhrase }}</p>
            <p>BS: {{ userProfile?.company?.bs }}</p>
          </div>
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
      color: #333;
      margin-bottom: 20px;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      min-width: 100px;
      font-weight: bold;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .address-details p,
    .company-details p {
      margin: 5px 0;
    }
    
    a {
      color: #007bff;
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: underline;
    }
  `]
})
export class UserProfileComponent {
  @Input() userProfile: UserProfile | null = null;
}
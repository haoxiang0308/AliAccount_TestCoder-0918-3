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
        <h2>{{ user.name }}</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Name:</strong> {{ user.name }}
        </div>
        <div class="detail-item">
          <strong>Email:</strong> <a href="mailto:{{ user.email }}">{{ user.email }}</a>
        </div>
        <div class="detail-item">
          <strong>Username:</strong> {{ user.username }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> <a href="tel:{{ user.phone }}">{{ user.phone }}</a>
        </div>
        <div class="detail-item">
          <strong>Website:</strong> <a href="http://{{ user.website }}" target="_blank">{{ user.website }}</a>
        </div>
        
        <div class="address-section" *ngIf="user.address">
          <h3>Address</h3>
          <div class="detail-item">
            <strong>Street:</strong> {{ user.address.street }}
          </div>
          <div class="detail-item">
            <strong>Suite:</strong> {{ user.address.suite }}
          </div>
          <div class="detail-item">
            <strong>City:</strong> {{ user.address.city }}
          </div>
          <div class="detail-item">
            <strong>Zipcode:</strong> {{ user.address.zipcode }}
          </div>
        </div>
        
        <div class="company-section" *ngIf="user.company">
          <h3>Company</h3>
          <div class="detail-item">
            <strong>Name:</strong> {{ user.company.name }}
          </div>
          <div class="detail-item">
            <strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}
          </div>
          <div class="detail-item">
            <strong>BS:</strong> {{ user.company.bs }}
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      margin: 0 0 15px 0;
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
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .address-section h3, .company-section h3 {
      margin: 0 0 10px 0;
      color: #444;
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
  @Input() user: User | undefined;
}
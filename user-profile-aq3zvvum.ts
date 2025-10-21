import { Component, OnInit } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  company: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
  address: {
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
    <div class="profile-container">
      <h1>User Profile</h1>
      <div *ngIf="user" class="profile-card">
        <h2>{{ user.name }}</h2>
        <div class="profile-details">
          <p><strong>Username:</strong> {{ user.username }}</p>
          <p><strong>Email:</strong> {{ user.email }}</p>
          <p><strong>Phone:</strong> {{ user.phone }}</p>
          <p><strong>Website:</strong> {{ user.website }}</p>
          <p><strong>Address:</strong> {{ user.address.street }}, {{ user.address.city }}, {{ user.address.zipcode }}</p>
          <p><strong>Company:</strong> {{ user.company.name }}</p>
          <p><strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}</p>
        </div>
      </div>
      <div *ngIf="!user" class="loading">
        <p>Loading user profile...</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-details p {
      margin: 10px 0;
      line-height: 1.5;
    }
    
    h1 {
      color: #333;
      text-align: center;
    }
    
    h2 {
      color: #444;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
    }
    
    .loading {
      text-align: center;
      padding: 20px;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  user: UserProfile | null = null;

  ngOnInit(): void {
    // Simulating loading user data (in a real app, this would come from a service)
    setTimeout(() => {
      this.user = {
        id: 1,
        name: 'John Doe',
        email: 'john.doe@example.com',
        username: 'johndoe',
        phone: '1-770-736-8031 x56442',
        website: 'hildegard.org',
        company: {
          name: 'Romaguera-Crona',
          catchPhrase: 'Multi-layered client-server neural-net',
          bs: 'harness real-time e-markets'
        },
        address: {
          street: 'Kulas Light',
          suite: 'Apt. 556',
          city: 'Gwenborough',
          zipcode: '92998-3874',
          geo: {
            lat: '-37.3159',
            lng: '81.1496'
          }
        }
      };
    }, 500);
  }
}
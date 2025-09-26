import { Component } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <h2>User Profile</h2>
      <div *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
      </div>
      <p *ngIf="!user">No user data available.</p>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-family: Arial, sans-serif;
    }
    h2 {
      color: #333;
    }
    p {
      margin: 8px 0;
    }
    strong {
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  user: User | undefined;

  constructor() {
    // Simulate loading user data, perhaps from a service
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      bio: 'Software Developer'
    };
  }
}
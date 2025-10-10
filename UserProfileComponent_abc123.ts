import { Component } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <h2>User Profile</h2>
      <div class="profile-card" *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <div *ngIf="!user">
        <p>Loading...</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .profile-card p {
      margin: 8px 0;
    }
  `]
})
export class UserProfileComponent {
  user: UserProfile | undefined;

  ngOnInit() {
    // Simulate fetching user data
    setTimeout(() => {
      this.user = {
        id: 1,
        name: 'John Doe',
        email: 'john.doe@example.com',
        role: 'Admin'
      };
    }, 500);
  }
}